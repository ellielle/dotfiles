local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	print("nvim-cmp failed to load")
	return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		-- Enter to confirm completions
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		-- move between completions
		["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-Tab>"] = cmp.mapping.select_prev_item(cmp_select),

		-- ctrl+space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})
