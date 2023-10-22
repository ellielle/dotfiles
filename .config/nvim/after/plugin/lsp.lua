local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

-- see :help lsp_zero_guide:integrate_with_mason_nvim
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {"tsserver", "eslint", "tailwindcss"},
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
	},
})

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
		-- Enter to confirm completions
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- ctrl+space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),

		-- move between completions
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	})
})

--lsp.set_preferences){
	-- sign_icons = { }
--)}

lsp.setup()
