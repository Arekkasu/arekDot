return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					--HTML
					"html",
					--CSS
          "cssls",
					--LUA LSP
					"lua_ls",
					--JAVSCRIPT / TYPESCRIPT LSP -- FRONT VUE LSP
					"tsserver",
					"vuels",
					-- C/C++ LSP
					"clangd",
					--python LSP
					"pylsp",
					--RUST LSP :D
					"rust_analyzer",
          --"standardjs",
          --EMMET
          "emmet_language_server"
				},
			})
		end,
	},
	{

		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local servers = {
				--HTML
				"html",
				--CSS,
				"cssls",
				--LUA LSP
				"lua_ls",
				--JAVSCRIPT / TYPESCRIPT LSP -- FRONT VUE LSP
				"tsserver",
				"vuels",
				-- C/C++ LSP
				"clangd",
				--python LSP
				"pylsp",
				--RUST LSP :D
				"rust_analyzer",
        --"standardjs",
        --emmet
        "emmet_language_server",
			}
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end

			--SHIFT+K para ver la declaracion
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			--gd para ver la definicion
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
