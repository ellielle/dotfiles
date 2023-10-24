-- remaps
require("el")

-- clone lazy.nvim if doesn't already exist
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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- colorschemes
  {
    'shatur/neovim-ayu',
    lazy = false,
  },

  -- plugins
  {
    -- highlighting for installed languages
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "lua", "vim", "vimdoc", "query", "html", "javascript", "typescript", "css", "vue", "svelte",
          "tsx", "json", "bash" },
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
  {
    -- mark files and easily move between them
    'theprimeagen/harpoon',
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>a",  "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Mark file with harpoon" },
      { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>",          desc = "Go to next harpoon mark" },
      { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          desc = "Go to previous harpoon mark" },
      { "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
    },
  },
  {
    -- oopsie tree
    "mbbill/undotree",
    keys = {
      { "<leader>u",  vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
      { "<leader>fu", vim.cmd.UndotreeFocus,  desc = "Focus undotree" },
    },
  },
  {
    -- git fun in vim
    "tpope/vim-fugitive",
  },
  {
    -- lsp-zero
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    -- LSP support
    { 'neovim/nvim-lspconfig' },
    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
  },
  {
    "nvim-tree/nvim-web-devicons"
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {}
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    "elentok/format-on-save.nvim",
    config = function()
      local format_on_save = require("format-on-save")
      local formatters = require("format-on-save.formatters")

      format_on_save.setup({
        exclude_path_patterns = {
          "/node_modules/",
          "./local/share/nvim/lazy"
        },
        formatter_by_ft = {
          css = formatters.prettierd,
          html = formatters.prettierd,
          javascript = formatters.prettierd,
          json = formatters.prettierd,
          lua = formatters.lsp,
          markdown = formatters.prettierd,
          scss = formatters.prettierd,
          typescript = formatters.prettierd,
          typescriptreact = formatters.prettierd,
          yaml = formatters.lsp,
        }
      })
    end
  },
  --  {
  --    "nvim-tree/nvim-tree.lua",
  --    version = "*",
  --    lazy = false,
  --    dependencies = {
  --      "nvim-tree/nvim-web-devicons"
  --    },
  --    config = function()
  --      require("nvim-tree").setup {}
  --    end
  --  },
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
})

-- colorscheme setup
require('ayu').setup({
  mirage = true,
})

require("ayu").colorscheme()

require("nvim-ts-autotag").setup()

require("lualine").setup({
  options = {
    theme = "ayu_mirage"
  }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = "Warning",
    },
    update_in_insert = true,
  }
)
