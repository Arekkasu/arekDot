
return {
    
    --theme scheme
     "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
    --ESTABLECIENDO ESQUEMA
    require("catppuccin").setup()
    vim.cmd.colorscheme "catppuccin-mocha"
    end
}
