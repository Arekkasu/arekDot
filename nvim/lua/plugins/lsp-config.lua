return {
    {"williamboman/mason.nvim",
    config = function()
        require("mason").setup({})
    end},
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls"}
            })
        end
    },
    {

        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local servers = { "html", "cssls", "lua_ls", "tsserver"}
            for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({})
            end

            --SHIFT+K para ver la declaracion
            vim.keymap.set('n','K',vim.lsp.buf.hover, {})
            --gd para ver la definicion
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
