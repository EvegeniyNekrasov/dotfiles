return {
    cmd = {
        "vscode-json-language-server",
        "--stdio"
    },
    filetypes = {
        "json", "jsonc"
    },
    root_markers = {
        {
            "package.json",
            "pnpm-lock.yaml"
        },
        ".git"
    },
    settings = {
        json = {
            validate = {
                enable = true
            }
        }
    }
}
