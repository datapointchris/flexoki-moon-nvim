local options = require("flexoki.config").options

local variants = {
	moon = {
		_nc = "#1f1d30",
		base = "#100f0f",
		surface = "#1f1d2e",
		overlay = "#1c1b1a",
		muted = "#575653",
		subtle = "#878580",
		text = "#cecdc3",
		yellow_one = "#ad8301",
		red_one = "#af3029",
		orange_one = "#bc5215",
		magenta_one = "#a02f6f",
		blue_one = "#205ea6",
		cyan_one = "#24837b",
		purple_one = "#5e409d",
		green_one = "#66800b",
		yellow_two = "#d0a215",
		red_two = "#d14d41",
		orange_two = "#da702c",
		magenta_two = "#ce5d97",
		blue_two = "#4385be",
		cyan_two = "#3aa99f",
		purple_two = "#8b7ec8",
		green_two = "#879a39",
		highlight_low = "#282726",
		highlight_med = "#343331",
		highlight_high = "#403e3c",
		none = "none",
		green_zero = "#EDEECF",
	},
	purple = {
		_nc = "#1f1d30",
		base = "#1f1d2e",
		surface = "#1f1d2e",
		overlay = "#1c1b1a",
		muted = "#575653",
		subtle = "#878580",
		text = "#cecdc3",
		yellow_one = "#ad8301",
		red_one = "#af3029",
		orange_one = "#bc5215",
		magenta_one = "#a02f6f",
		blue_one = "#205ea6",
		cyan_one = "#24837b",
		purple_one = "#5e409d",
		green_one = "#66800b",
		yellow_two = "#d0a215",
		red_two = "#d14d41",
		orange_two = "#da702c",
		magenta_two = "#ce5d97",
		blue_two = "#4385be",
		cyan_two = "#3aa99f",
		purple_two = "#8b7ec8",
		green_two = "#879a39",
		highlight_low = "#282726",
		highlight_med = "#343331",
		highlight_high = "#403e3c",
		none = "none",
		green_zero = "#EDEECF",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return variants.purple
