# flexoki-moon-nvim

A Neovim colorscheme plugin holding dark variants of Flexoki. It is a fork of nuvic/flexoki-nvim,
which takes its structure from rose-pine/neovim. Each variant loads as
`:colorscheme flexoki-moon-<variant>`.

## The colorscheme name picks the variant

Each file in `colors/` is two lines. The first clears `package.loaded["flexoki.palette"]`, and the
second calls `require("flexoki").colorscheme("<variant>")`. Both are required.

- **`palette.lua` resolves the variant once, when it is first required.** It reads
  `config.options.variant` at that moment and returns that variant's table. A second
  `colorscheme()` call with the module still cached sets the new name and paints the old palette.
- **`setup()` records options and applies nothing.** A `colors/` file calling it in place of
  `colorscheme()` loads no highlights.
- **An explicit variant outranks `setup({ variant = ... })`.** The `variant`, `dark_variant` and
  `light_variant` options act only through a call to `colorscheme()` with no argument, and no
  `colors/` file makes one. So `:colorscheme flexoki-moon-black` ignores `vim.o.background`.
- **`colorscheme(<variant>)` writes the variant into `config.options`.** After any
  `:colorscheme flexoki-moon-*`, a no-argument call reuses that variant instead of resolving
  `"auto"`.

`vim.g.colors_name` is `flexoki-moon-<variant>`, the name of the `colors/` file that applies it.
`:colorscheme` cannot reload a name with no file behind it.

## Every variant is dark

Every palette's `base` is a dark color, toddler's included. With `variant = "auto"`, a light
`background` resolves to `light_variant`, which defaults to toddler, so it still gets a dark
scheme. The fork carries none of Flexoki's light palette.

## A variant is a palette table and a colors file

Adding one takes three edits:

- a table in `variants` in `lua/flexoki/palette.lua`, carrying every key its siblings carry;
- `colors/flexoki-moon-<name>.lua`, the same two lines as its siblings;
- the name in the `Variant` alias in `lua/flexoki/config.lua`.

A key missing from one variant raises no error. A group reading it is set without that color.

Two keys look unused and are not:

- **`none` is how the string `"NONE"` resolves.** `utilities.parse_color` lowercases a value before
  comparing it with `"NONE"`, so the comparison never matches and the lookup lands on
  `palette.none`.
- **`_nc` is the inactive-window background** that `dim_inactive_windows` switches to.

Variants other than toddler hold Flexoki's accents unchanged and differ in the rest. `_one` is
Flexoki's 600 shade and `_two` its 400. Syntax groups read the `_two` accents, and the colored git
groups default to `_one`.

## Highlights live in one table, grouped by plugin

`set_highlights()` in `lua/flexoki.lua` builds every group. Plugin support takes two forms:

- A plugin that reads highlight groups gets entries in `default_highlights`, under a comment
  naming its `owner/repo`.
- A plugin configured through its own `setup()` gets a module in `lua/flexoki/plugins/` returning
  what that setup takes. Each module's header shows the call. Lualine themes sit in
  `lua/lualine/themes/`, the path lualine resolves a theme name against.

Those modules read `flexoki.palette` when first loaded, so each holds the variant active then.

**`blend` is a color mix computed here.** A group carrying `blend = N` and a `bg` has its `bg`
replaced by that color mixed N percent over `palette.base`. Tinted backgrounds are written that
way: the full-strength accent as `bg`, the strength as `blend`.

**`styles.transparency` clears backgrounds group by group.** It overlays `transparency_highlights`
on the defaults. A new group with a `bg` keeps it in transparent mode unless it is listed there.

## Nothing loads the colorscheme in CI

There is no test suite. CI runs the commit hooks, and none of them loads a variant. From the repo
root, this loads one with no user config, and a load error prints there:

```sh
nvim --clean --cmd 'set rtp^=.' -c 'colorscheme flexoki-moon-black'
```

StyLua has no config file here. It takes its two-space indent from `.editorconfig`.
