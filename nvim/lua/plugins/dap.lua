return {

    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        -- stylua: ignore
        keys = {
            { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
            { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
    {

        "mfussenegger/nvim-dap",
        optional = true,
        dependencies = {
            {
                "williamboman/mason.nvim",
                opts = function(_, opts)
                    opts.ensure_installed = opts.ensure_installed or {}
                    table.insert(opts.ensure_installed, "js-debug-adapter")
                end,
            },
        },
        config = function()
            local dap = require("dap")
            if not dap.adapters["pwa-node"] then
                require("dap").adapters["pwa-node"] = {
                    type = "server",
                    host = "localhost",
                    port = 8123,
                    executable = {
                        command = "node",
                        -- 💀 Make sure to update this path to point to your installation
                        args = {
                            "/home/arekkasu/.config/nvim/vscode-js-debug/out/src/vsDebugServer.js",
                            "8123",
                        },
                    },
                }
            end
            if not dap.adapters["node"] then
                dap.adapters["node"] = function(cb, config)
                    if config.type == "node" then
                        config.type = "pwa-node"
                    end
                    local nativeAdapter = dap.adapters["pwa-node"]
                    if type(nativeAdapter) == "function" then
                        nativeAdapter(cb, config)
                    else
                        cb(nativeAdapter)
                    end
                end
            end

            local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

            local vscode = require("dap.ext.vscode")
            vscode.type_to_filetypes["node"] = js_filetypes
            vscode.type_to_filetypes["pwa-node"] = js_filetypes

            for _, language in ipairs(js_filetypes) do
                if not dap.configurations[language] then
                    dap.configurations[language] = {
                        {
                            type = "pwa-node",
                            request = "launch",
                            name = "Launch file",
                            program = "${file}",
                            cwd = "${workspaceFolder}",
                        },
                        {
                            type = "pwa-node",
                            request = "attach",
                            name = "Attach",
                            processId = require("dap.utils").pick_process,
                            cwd = "${workspaceFolder}",
                        },
                    }
                end
            end
        end,
    }
}
