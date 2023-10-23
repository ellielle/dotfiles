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
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("nvim-tree").setup {}
    end
  },
  {
    "nvim-tree/nvim-web-devicons"
  },
  --{
  --  "nvim-neo-tree/neo-tree.nvim",
  --  branch = "v3.x",
  --  dependencies = {
  --    "nvim-lua/plenary.nvim",
  --    "nvim-tree/nvim-web-devicons",
  --    "MunifTanjim/nui.nvim",
  --  },
  -- }
})

-- colorscheme setup
require('ayu').setup({
  mirage = true,
})

require("ayu").colorscheme()
