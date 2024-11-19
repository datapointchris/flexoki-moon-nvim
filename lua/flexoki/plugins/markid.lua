--- Rosé Pine for markid
--- https://github.com/David-Kunz/markid
---
--- @usage
--- local highlights = require("flexoki.plugins.markid")
--- require("nvim-treesitter.configs").setup({ markid = { enable = true, colors = highlights } })

local p = require("flexoki.palette")

return { p.cyan_two, p.magenta_two, p.purple_two }
