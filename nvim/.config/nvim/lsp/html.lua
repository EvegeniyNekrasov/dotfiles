return {
    cmd = {
        "vscode-html-language-server",
        "--stdio"
    },
    filetypes = { "html" },
    root_markers = {
        {
            "package.json",
            "vite.config.js",
            "vite.config.ts"
        },
        ".git"
    }
}
