return {

    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({

            --PASARLO A AUTOINSTALADO
            --ensure_installed = { "lua", "java", "javascript" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
