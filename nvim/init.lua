vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
--TECLA LIDER
vim.g.mapleader = " "



--LAZY MANAGER

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {

    --theme scheme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },    

    --telescope
    {
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' }
    },
    
    --tree sitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    
    --nvim tree
    {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    	}
    },

    {
    'nvim-tree/nvim-web-devicons'
    }

}
local opts = {}
require("lazy").setup(plugins, opts)



--ESTABLECIENDO ESQUEMA
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-mocha"

local builtin = require("telescope.builtin")

local config = require("nvim-treesitter.configs")
config.setup({

    ensure_installed = {"lua", "java", "javascript"},
    highlight = {enable = true},
    indent = {enable = true}

})

--FORMA PARA HACER LOS ATAJOS
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-n>', "<CMD> Neotree toggle <CR>", {})
