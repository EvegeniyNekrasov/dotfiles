return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {},
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            terminal_colors = true,
        })

        vim.cmd("colorscheme gruvbox")
    end
}
