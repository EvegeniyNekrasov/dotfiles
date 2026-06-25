return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, the latest stabled
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    opts = {
        workspaces = {
            {
                name = "notes",
                path = "~/Desktop/personal/personal_brain/notes"
            }
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2
        }
    }
}
