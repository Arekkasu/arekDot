return {

	"zaldih/themery.nvim",
	config = function()
		-- Set custom name to the list
		require("themery").setup({
			themes = {
				{
					name = "catppuccin",
					colorscheme = "catppuccin",
				},
				{
					name = "catppuccin-frappe",
					colorscheme = "catppuccin-frappe",
				},
				{
					name = "catppuccin-latte",
					colorscheme = "catppuccin-latte",
				},
				{
					name = "catppuccin-macchiato",
					colorscheme = "catppuccin-macchiato",
				},
				{
					name = "catppuccin-mocha",
					colorscheme = "catppuccin-mocha",
				},
				{
					name = "kanagawa",
					colorscheme = "kanagawa-dragon",
				},

				{
					name = "sonokai",
					colorscheme = "sonokai",
				},
				{
					name = "minimal",
					colorscheme = "minimal",
				},
				{
					name = "Everblush",
					colorscheme = "everblush",
				},
				{
					name = "Aquarium",
					colorscheme = "aquarium",
				},
        {
          name = "Calvera",
          colorscheme = "calvera"

        },
        {
       name = "Material",
          colorscheme = "material"
        },
        {
          name = "onedark dark",
          colorscheme = "onedark_dark"
        },
        {
        name = "onedark",
          colorscheme = "onedark"
        },
        {
          name = "onedark vivid",
          colorscheme = "onedark_vivid"
        }
			},
			themeConfigFile = "~/.config/nvim/lua/theme.lua",
		})
		vim.keymap.set("n", "<leader>th", ":Themery<CR>", {})
	end,
}
