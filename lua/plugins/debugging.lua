return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_python = require("dap-python")

            require("dapui").setup({})
            require("nvim-dap-virtual-text").setup({
                commented = true, --Show virtual text alongside comment
            })
            dap_python.setup("python3")

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggles debugger breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Runs/continues debugger" })
            vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Kills debugger" })
            vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggles DAP UI" })
        end,
    },
}
