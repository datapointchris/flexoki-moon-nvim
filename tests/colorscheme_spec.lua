-- Run: nvim --headless -u NONE -l tests/colorscheme_spec.lua

local repo_root = vim.fn.fnamemodify(debug.getinfo(1, 'S').source:sub(2), ':p:h:h')
vim.opt.runtimepath:prepend(repo_root)
local flexoki = require('flexoki')
local config = require('flexoki.config')

local failures = {}
local function check(name, ok)
  if not ok then
    table.insert(failures, name)
  end
  print((ok and 'ok   ' or 'FAIL ') .. name)
end

local variants = {}
for _, path in ipairs(vim.fn.globpath(repo_root, 'colors/flexoki-moon-*.lua', false, true)) do
  local variant = vim.fn.fnamemodify(path, ':t:r'):gsub('^flexoki%-moon%-', '')
  table.insert(variants, variant)
end
table.sort(variants)
check('colors/ holds a variant', #variants > 0)

local function palette_for(variant)
  config.extend_options({ variant = variant })
  package.loaded['flexoki.palette'] = nil
  return require('flexoki.palette')
end

local palettes = {}
for _, variant in ipairs(variants) do
  palettes[variant] = palette_for(variant)
end

-- palette.lua falls back to black, so a colors/ file with no table paints black.
for _, variant in ipairs(variants) do
  if variant ~= 'black' then
    check(variant .. ' has a palette of its own', not vim.deep_equal(palettes[variant], palettes.black))
  end
end

-- A key one variant lacks raises no error. The group reading it is set without that color.
local keys = {}
for _, palette in pairs(palettes) do
  for key in pairs(palette) do
    keys[key] = true
  end
end
for _, variant in ipairs(variants) do
  local missing = {}
  for key in pairs(keys) do
    if palettes[variant][key] == nil then
      table.insert(missing, key)
    end
  end
  table.sort(missing)
  local detail = #missing > 0 and (', missing ' .. table.concat(missing, ' ')) or ''
  check(variant .. ' carries every palette key its siblings carry' .. detail, #missing == 0)
end

local function normal_fg()
  return vim.api.nvim_get_hl(0, { name = 'Normal' }).fg
end

local function hex(color)
  return tonumber(color:sub(2), 16)
end

for _, variant in ipairs(variants) do
  vim.cmd('colorscheme flexoki-moon-' .. variant)
  check(variant .. ' sets colors_name to its colors/ file', vim.g.colors_name == 'flexoki-moon-' .. variant)
  check(variant .. ' paints Normal with its own text color', normal_fg() == hex(palettes[variant].text))
end

vim.cmd('hi clear')
vim.g.colors_name = nil
flexoki.setup({ variant = 'red' })
check('setup() records options and paints nothing', vim.g.colors_name == nil)

if vim.tbl_contains(variants, 'green') and vim.tbl_contains(variants, 'red') then
  flexoki.setup({ variant = 'red' })
  vim.cmd('colorscheme flexoki-moon-green')
  check('an explicit variant outranks setup({ variant })', vim.g.colors_name == 'flexoki-moon-green')
  check('the palette painted is the variant named', normal_fg() == hex(palettes.green.text))
end

flexoki.colorscheme('no-such-variant')
check('a variant with no colors/ file loads black', vim.g.colors_name == 'flexoki-moon-black')
check('and paints black', normal_fg() == hex(palettes.black.text))

if #failures > 0 then
  print('FAILED: ' .. table.concat(failures, ', '))
  vim.cmd('cquit')
end
print('all colorscheme tests passed')
vim.cmd('qall!')
