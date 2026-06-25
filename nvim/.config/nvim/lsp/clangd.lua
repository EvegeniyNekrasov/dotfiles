return {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy"
    },
    filetypes = { "c", "c++", "objc", "objcpp" },
    -- this permits to nvim detect automaticly the root of the project
    -- it's a native and recomended way by LPS API
    root_markers = {
        ".clangd",
        "compile_commands.json",
        "compile_flags.txt",
        ".git"
    }
}
