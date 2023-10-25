-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	print("lualine failed to load")
	return
end

require("lualine").setup({
	options = {
		theme = "ayu_mirage",
	},
})
