return {
	-- To enable formatting
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				--css
        null_ls.builtins.formatting.stylelint,
        --lua
				null_ls.builtins.formatting.stylua,
				--javascript
				--require("none-ls.diagnostics.eslint_d"),
        --null_ls.builtins.formatting.standardjs,
				null_ls.builtins.formatting.prettier,
				--python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				--Padre C
				null_ls.builtins.formatting.clang_format,
				--SE DEBE INSTALAR CPPCHECK EN EL SISTEMA
				null_ls.builtins.diagnostics.cppcheck,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
