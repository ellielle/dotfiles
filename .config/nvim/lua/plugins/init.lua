return {
	-- "folke/whick-key.nvim",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = function()
			require("plugins.config.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	},

	-- plugins
	{
		-- highlighting for installed languages
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("plugins.config.treesitter")
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring", -- allow comments in mixed content files like jsx, html and svelte
			"windwp/nvim-ts-autotag", -- autoclose html tags
		},
	},

	{
		-- mark files and easily move between them
		"ThePrimeagen/harpoon",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = true,
		keys = {
			{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
			{
				"<leader>hn",
				"<cmd>lua require('harpoon.ui').nav_next()<cr>",
				desc = "Go to next harpoon mark",
			},
			{
				"<leader>hp",
				"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
				desc = "Go to previous harpoon mark",
			},
			{ "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
		},
	},

	{
		-- oopsie tree
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
			{ "<leader>fu", vim.cmd.UndotreeFocus, desc = "Focus undotree" },
		},
	},

	{
		-- git fun in vim
		"tpope/vim-fugitive",
	},

	-- configure LSP servers
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp.lspconfig")
		end,
		dependencies = {
			"pmizio/typescript-tools.nvim", -- Alternative to typescript server (requires plenary)
		},
	},

	-- manages and installs lsp servers/linters/formatters
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.config.lsp.mason")
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- bridges gap between mason & lspconfig
			"WhoIsSethDaniel/mason-tool-installer.nvim", -- sets up automatic installs for Mason
		},
	},

	-- autocompletion and snippets
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.nvim-cmp")
		end,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
		},
	},

	--	{
	--		-- lsp-zero
	--		{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	--	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.config.lualine")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"elentok/format-on-save.nvim",
		config = function()
			local format_on_save = require("format-on-save")
			local formatters = require("format-on-save.formatters")

			format_on_save.setup({
				exclude_path_patterns = {
					"/node_modules/",
					"./local/share/nvim/lazy",
				},
				formatter_by_ft = {
					css = formatters.prettierd,
					html = formatters.prettierd,
					javascript = formatters.prettierd,
					json = formatters.prettierd,
					lua = formatters.stylua,
					markdown = formatters.prettierd,
					scss = formatters.prettierd,
					typescript = formatters.prettierd,
					typescriptreact = formatters.prettierd,
					yaml = formatters.lsp,
				},
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	-- colorschemes
	{
		"shatur/neovim-ayu",
		lazy = false,
	},

	--	{
	--		"pmizio/typescript-tools.nvim",
	--		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	--		opts = {},
	--	},
	--  {
	--    "nvim-neo-tree/neo-tree.nvim",
	--    branch = "v3.x",
	--    dependencies = {
	--      "nvim-lua/plenary.nvim",
	--      "nvim-tree/nvim-web-devicons",
	--      "MunifTanjim/nui.nvim",
	--      {
	--        's1n7ax/nvim-window-picker',
	--        version = '2.*',
	--        config = function()
	--          require("window-picker").setup({
	--            filter_rules = {
	--              include_current_win = false,
	--              autoselecto_one = true,
	--              bo = {
	--                filetype = { "neo-tree", "neo-tree-popup", "notify" },
	--                buftype = { "terminal", "quickfix" },
	--              },
	--            },
	--          })
	--        end,
	--      },
	--      config = function()
	--        require("neo-tree").setup({
	--          close_if_last_window = false,
	--          popup_border_style = "rounded",
	--          enable_git_status = true,
	--          enable_diagnostics = true,
	--          enable_normal_mode_for_inputs = false,
	--
	--          filesystem = {
	--            filtered_items = {
	--              visible = true,
	--              hide_gitignored = true,
	--              hide_dotfiles = true,
	--              hide_by_name = {
	--                ""
	--              },
	--            },
	--          },
	--          hijack_netrw_behavior = "open_current",
	--        })
	--      end
	--    },
	--  },
	--{
	--  "alexghergh/nvim-tmux-navigation",
	--  config = function()
	--    local nvim_tmux_nav = require("nvim-tmux-navigation")

	--    vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
	--   vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
	--    vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
	--   vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
	--    vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
	--    vim.keymap.set("n", "<C-Esc>", nvim_tmux_nav.NvimTmuxNavigateNext)
	--  end,
	-- },
}
