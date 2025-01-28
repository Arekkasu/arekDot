return {
  {
    --theme scheme
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    --config = function()
    --ESTABLECIENDO ESQUEMA
    --	require("catppuccin").setup()
    --	require("theme")
    --vim.cmd.colorscheme "catppuccin-mocha"
    --end,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    ("sainnhe/sonokai"),
  },
  {
    "Yazeed1s/minimal.nvim",
  },
  { "Everblush/nvim",              name = "everblush" },
  { "frenzyexists/aquarium-vim" },
  { "yashguptaz/calvera-dark.nvim" },
  { "marko-cerovac/material.nvim" },
  {

    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  {
    "samharju/synthweave.nvim",
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "Mofiqul/dracula.nvim" }
  ,
  { 'shaunsingh/nord.nvim' }
  ,
  {
    'uloco/bluloco.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'rktjmp/lush.nvim' },
    config = function()
      -- your optional config goes here, see below.
    end,
  }
}
