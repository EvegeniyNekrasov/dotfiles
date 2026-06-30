return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, the latest stabled
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
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
        },
    },
    dayly_notes = {
        folder = "notes/dailies",
        date_format = "%Y-%m-%d",
        default_tags = { "daily-notes" },
        template = nil
    },
    disable_frontmatter = false,
}
