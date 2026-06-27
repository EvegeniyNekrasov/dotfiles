return {
    "mfussenegger/nvim-dap",

    config = function()
        local dap = require("dap")

        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)

        vim.keymap.set("n", "<F5>", dap.continue)

        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<S-F11>", dap.step_out)

        vim.keymap.set("n", "<leader>dr", dap.repl.open)
        vim.keymap.set("n", "<leader>dt", dap.terminate)
    end
}
