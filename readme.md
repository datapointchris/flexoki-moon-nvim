<p align="center">
    <h2 align="center">Flexoki for neovim</h2>
</p>

> Flexoki is an inky color scheme for prose and code. Flexoki is designed for reading and writing on digital screens. It is inspired by analog printing inks and warm shades of paper

This repo contains a light and dark theme for Flexoki, based on [https://stephango.com/flexoki](https://stephango.com/flexoki). This repo was based off of [rose-pine/neovim](https://github.com/rose-pine/neovim).

## Getting started

Install `flexoki-nvim` using your favourite plugin manager:

**lazy.nvim**

```lua
{ "nuvic/flexoki-nvim", name = "flexoki" }
```

**paq-nvim**

```lua
{ "nuvic/flexoki-nvim", as = "flexoki" }
```

## Gallery

**Flexoki Dawn**

![flexoki-dawn](https://github.com/user-attachments/assets/8ad5bd55-6da8-4966-8c4e-360be0a8847a)

**Flexoki Moon**

![flexoki-moon](https://github.com/user-attachments/assets/f29beed6-6cf8-48d3-90cb-b4a10f00e373)

## Options

> [!IMPORTANT]
> Configure options _before_ setting colorscheme.

Flexoki has two variants: moon, and dawn. By default, `vim.o.background` is followed, using dawn when light and moon when dark.

Colour values accept named colours from the palette, e.g. "cyan_two", or valid hex, e.g. "#fa8072".

```lua
require("flexoki").setup({
    variant = "auto", -- auto, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = false,
        transparency = false,
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
        -- moon = {
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

vim.cmd("colorscheme flexoki")
-- vim.cmd("colorscheme flexoki-moon")
-- vim.cmd("colorscheme flexoki-dawn")
```

> [!NOTE]
> Visit the [wiki](https://github.com/nuvic/flexoki-nvim/wiki) for issues with plugins.

## Contributing

We welcome and appreciate contributions of any kind. Create an issue or start a discussion for any proposed changes. Pull requests are encouraged for supporting additional plugins or [treesitter improvements](https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights).

Feel free to update the [wiki](https://github.com/nuvic/flexoki-nvim/wiki/) with any recipes.
