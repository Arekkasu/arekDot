return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				--mapping = cmp.mapping.preset.insert({
				--	["<C-b>"] = cmp.mapping.scroll_docs(-4),
				--	["<C-f>"] = cmp.mapping.scroll_docs(4),
				--	["<C-Space>"] = cmp.mapping.complete(),
				--	["<C-e>"] = cmp.mapping.abort(),
				--	["<CR>"] = cmp.mapping.confirm({ select = true }),
				--}),
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() and cmp.get_selected_entry() then
							cmp.confirm({ select = true })
						else
							fallback() -- Si no hay una opción seleccionada, se hace un salto de línea
						end
					end),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					--{ name = "vsnip" }, -- For vsnip users.
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
