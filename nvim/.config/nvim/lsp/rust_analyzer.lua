local rust_analyzer = vim.fs.joinpath(
    vim.env.HOME,
    ".cargo",
    "bin",
    "rust-analyzer"
)

return {
    cmd = {
        rust_analyzer,
    },

    filetypes = {
        "rust",
    },

    root_markers = {
        "Cargo.toml",
        "rust-project.json",
        ".git",
    },

    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
            },
        },
    },
}
