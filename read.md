<p align="center">
    <h2 align="center">Flexoki Moon - Custom Variants</h2>
</p>

> Flexoki is an inky color scheme for prose and code. Flexoki is designed for reading and writing on digital screens. It is inspired by analog printing inks and warm shades of paper

This fork provides custom variants (black, purple, green, red, toddler) of the Flexoki colorscheme for Neovim.

**Credits:**

- Original Flexoki colorscheme by [Steph Ango](https://stephango.com/flexoki)
- Neovim implementation by [nuvic/flexoki-nvim](https://github.com/nuvic/flexoki-nvim)
- Based on the excellent [rose-pine/neovim](https://github.com/rose-pine/neovim) structure

This fork is available for anyone who finds the variants useful.

## Getting started

Install using your favourite plugin manager:

**lazy.nvim**

```lua
{ "datapointchris/flexoki-moon-nvim" }
```

**paq-nvim**

```lua
{ "datapointchris/flexoki-moon-nvim" }
```

## Gallery

**Flexoki Moon Black**

![flexoki-moon](https://github.com/user-attachments/assets/f29beed6-6cf8-48d3-90cb-b4a10f00e373)

**Flexoki Moon Purple**

![flexoki-moon-purple](https://github.com/user-attachments/assets/purple-variant-placeholder)

**Flexoki Moon Green**

![flexoki-moon-green](https://github.com/user-attachments/assets/green-variant-placeholder)

**Flexoki Moon Red**

![flexoki-moon-red](https://github.com/user-attachments/assets/red-variant-placeholder)

**Flexoki Moon Toddler**

![flexoki-moon-toddler](https://github.com/user-attachments/assets/toddler-variant-placeholder)

## Options

> [!IMPORTANT]
> Configure options _before_ setting colorscheme.

Flexoki has five variants: black, purple, green, red, and toddler. By default, `vim.o.background` is followed, using black when dark and toddler when light.

Colour values accept named colours from the palette, e.g. "cyan_two", or valid hex, e.g. "#fa8072".

```lua
require("flexoki").setup({
    variant = "auto", -- auto, black, purple, green, red, or toddler
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
    },

    styles = {
        bold = true,
        italic = false,
    },

    groups = {
        border = "muted",
        link = "purple_two",
        panel = "surface",

        error = "red_one",
        hint = "purple_one",
        info = "cyan_one",
        ok = "green_one",
        warn = "orange_one",
        note = "blue_one",
        todo = "magenta_one",

        git_add = "green_one",
        git_change = "yellow_one",
        git_delete = "red_one",
        git_dirty = "yellow_one",
        git_ignore = "muted",
        git_merge = "purple_one",
        git_rename = "blue_one",
        git_stage = "purple_one",
        git_text = "magenta_one",
        git_untracked = "subtle",

        h1 = "purple_two",
        h2 = "cyan_two",
        h3 = "magenta_two",
        h4 = "orange_two",
        h5 = "blue_two",
        h6 = "cyan_two",
    },

    palette = {
        -- Override the builtin palette per variant
        -- black = {
        --     base = '#100f0f',
        --     overlay = '#1c1b1a',
        -- },
    },

    highlight_groups = {
        -- Comment = { fg = "subtle" },
        -- VertSplit = { fg = "muted", bg = "muted" },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.blue_two then
        --     highlight.fg = palette.cyan_two
        -- end
    end,
})

-- Available colorscheme options:
vim.cmd("colorscheme flexoki-moon-black")   -- Default dark variant
-- vim.cmd("colorscheme flexoki-moon-purple") -- Purple variant  
-- vim.cmd("colorscheme flexoki-moon-green")  -- Green variant
-- vim.cmd("colorscheme flexoki-moon-red")    -- Red variant
-- vim.cmd("colorscheme flexoki-moon-toddler") -- Toddler variant (default light)
```
