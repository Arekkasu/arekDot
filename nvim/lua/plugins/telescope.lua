return {
    {'nvim-telescope/telescope.nvim', tag = '0.1.6',
	branch = '0.1.x',
	dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require("telescope.builtin")
        --FORMA PARA HACER LOS ATAJOS
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
            -- This is your opts table
        config = function()
                    require("telescope").setup {
              extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                      }
                }
            }
        }
                require("telescope").load_extension("ui-select")
        end
    }
}
