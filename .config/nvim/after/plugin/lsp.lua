local lsp = require("lsp-zero")

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- see :help lsp_zero_guide:integrate_with_mason_nvim
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "eslint", "tailwindcss", "cssls", "html", "jsonls", "svelte", "tailwindcss", "lua_ls" },
  handlers = {
    lsp.default_setup,
    tsserver = function()
      require("lspconfig").tsserver.setup({
        settings = {
          completions = {
            completionFunctionCalls = true
          }
        }
      })
    end,
    lua_ls = function()
      require("lspconfig").lua_ls.setup({
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
              Lua = {
                runtime = { version = "LuaJIT" },
                workspace = {
                  checkThirdparth = false,
                  library = {
                    vim.env.VIMRUNTIME
                  }
                }
              }
            })
            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end
      })
    end
  },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- Enter to confirm completions
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    -- move between completions
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),

    -- ctrl+space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),
  })
})

lsp.setup()
