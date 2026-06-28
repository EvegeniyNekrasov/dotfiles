return {

    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    opts = {
        completions = {
            lsp = { enabled = true },
        },
    },
    keys = {
        {
            "<leader>mt",
            function()
                require("render-markdown").buf_toggle()
            end,
            desc = "Markdown: alternar renderizado",
        },
        {
            "<leader>mp",
            function()
                require("render-markdown").preview()
            end,
            desc = "Markdown: abrir preview lateral",
        },
        {
            "<leader>me",
            function()
                require("render-markdown").expand()
            end,
            desc = "Markdown: expandir texto original",
        },
        {
            "<leader>mc",
            function()
                require("render-markdown").contract()
            end,
            desc = "Markdown: contraer texto original",
        },
    },
}
