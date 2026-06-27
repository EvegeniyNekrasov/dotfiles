return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".git"
    },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            completion = {
                callSnippet = "Replace"
            },
            workspace = {
                checkThirdParty = false
            },
            telemetry = {
                enable = false
            }
        }
    }
}
