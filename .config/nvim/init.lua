-- remaps
require("el")

-- install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- "folke/whick-key.nvim",
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- colorschemes
	{
		'shatur/neovim-ayu',
	},
	-- plugins
	{
		'nvim-treesitter/nvim-treesitter', 
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc", "query", "html", "javascript", "typescript", "css", "vue", "svelte", "tsx", "json", "bash" },
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
			})
		end
	},
})

-- colorscheme setup
require('ayu').setup({
	mirage = true,
})

require("ayu").colorscheme()

local options = { 
	tabstop = 2, -- tabbed lines will appear indented by this many characters expandtab = true,
	shiftwidth = 2, -- number of spaces inserted for each tab/indent
	number = true, -- turn on line numbers
	relativenumber = true, -- relative line numbers
	splitbelow = true, -- new windows are created above
	splitright = true, -- new windows are created to the left
	scrolloff = 8, -- minimum visible lines above/below
	ignorecase = true,
	smartcase = true, -- ignore case if only lower case is used (only used when ignorecase is on)
	hlsearch = true, -- highlight all matches on previous search pattern
	breakindent = true, -- wrapped lines continue with the same indent
	-- completeopt = { "menuone", "noselect", }, -- use the same menu when one or more options available, don't select by default
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
