return {
    cmd = {
        "vscode-css-language-server",
        "--stdio"
    },
    filetypes = {
        "css",
        "scss",
        "less"
    },
    root_markers = {
        {
            "package.json",
            "vite.config.js",
            "vite.config.ts",
        },
        ".git"
    }
}
