---@alias Variant "black" | "purple" | "green" | "red" | "toddler"
---@alias Palette { base: string, surface: string, overlay: string, muted: string, subtle: string, text: string, red_two: string, orange_two: string, magenta_two: string, blue_two: string, cyan_two: string, purple_two: string }
---@alias PaletteColor "base" | "surface" | "overlay" | "muted" | "subtle" | "text" | "red_two" | "orange_two" | "magenta_two" | "blue_two" | "cyan_two" | "purple_two" | "highlight_low" | "highlight_med" | "highlight_high"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local config = {}

---@class Options
config.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---defaulting to `dark_variant` for dark and `toddler` for light.
	---@type "auto" | Variant
	variant = "auto",

	---Set the desired dark variant when `options.variant` is set to "auto".
	---@type Variant
	dark_variant = "black",

	---Set the desired light variant when `options.variant` is set to "auto".
	---@type Variant
	light_variant = "toddler",

	---Differentiate between active and inactive windows and panels.
	dim_inactive_windows = false,

	---Extend background behind borders. Appearance differs based on which
	---border characters you are using.
	extend_background_behind_borders = true,

	enable = {
		legacy_highlights = true,
		terminal = true,
	},

	styles = {
		bold = true,
		italic = false,
		transparency = false,
	},

	---@type table<string, table<string, string>>
	palette = {},

	---@type table<string, string | PaletteColor>
	groups = {
		border = "muted",
		link = "purple_two",
		panel = "surface",

		error = "red_two",
		hint = "purple_two",
		info = "cyan_two",
		ok = "green_two",
		warn = "orange_two",
		note = "blue_two",
		todo = "magenta_two",

		git_add = "green_one",
		git_change = "yellow_one",
		git_delete = "red_one",
		git_dirty = "yellow_one",
		git_ignore = "muted",
		git_merge = "purple_one",
		git_rename = "blue_one",
		git_stage = "purple_one",
		git_text = "blue_one",
		git_untracked = "subtle",

		---@type string | PaletteColor
		h1 = "purple_two",
		h2 = "cyan_two",
		h3 = "magenta_two",
		h4 = "orange_two",
		h5 = "blue_two",
		h6 = "green_two",
	},

	---@type table<string, Highlight>
	highlight_groups = {},

	---Called before each highlight group, before setting the highlight.
	---@param group string
	---@param highlight Highlight
	---@param palette Palette
	---@diagnostic disable-next-line: unused-local
	before_highlight = function(group, highlight, palette) end,
	---@deprecated Replaced by `options.highlight_groups`
	-- bold_vert_split = false
}

---@param options Options | nil
function config.extend_options(options)
	config.options = vim.tbl_deep_extend("force", config.options, options or {})
end

return config
