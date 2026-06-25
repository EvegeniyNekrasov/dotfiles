local M = {}

-- Utils
local function notify(message, level)
    vim.notify(message, level or vim.log.levels.INFO)
end

local function current_file()
    local file = vim.api.nvim_buf_get_name(0)

    if file == "" then
        return nil
    end

    return vim.fs.normalize(file)
end

local function find_root(markers)
    local file = current_file()

    if not file then
        return vim.uv.cwd()
    end

    return vim.fs.root(file, markers)
        or vim.fs.dirname(file)
end

local function shellescape(value)
    return vim.fn.shellescape(value)
end

-- Terminal 
local function run_in_terminal(command, cwd)
    vim.cmd("write")

    vim.cmd("botright 15split")
    vim.cmd("terminal")

    local buffer = vim.api.nvim_get_current_buf()
    local job = vim.bo[buffer].channel

    vim.fn.chansend(job, {
        "cd " .. shellescape(cwd),
        command,
        "",
    })

    vim.cmd("startinsert")
end

-- Project detection
local function project_type()
    local filetype = vim.bo.filetype

    if filetype == "rust" then
        return "rust"
    end

    if filetype == "c" or filetype == "cpp" then
        return "c"
    end

    return nil
end

local function rust_root()
    return find_root({
        "Cargo.toml",
        ".git",
    })
end

local function c_root()
    return find_root({
        "Makefile",
        "makefile",
        "CMakeLists.txt",
        ".git",
    })
end

local function has_file(root, names)
    for _, name in ipairs(names) do
        if vim.uv.fs_stat(vim.fs.joinpath(root, name)) then
            return true
        end
    end

    return false
end

-- Build
function M.build()
    local kind = project_type()

    if kind == "rust" then
        run_in_terminal("cargo build", rust_root())
        return
    end

    if kind == "c" then
        local root = c_root()

        if has_file(root, { "Makefile", "makefile" }) then
            run_in_terminal("make", root)
            return
        end

        local file = current_file()

        if not file then
            notify("No C file opened", vim.log.levels.WARN)
            return
        end

        local output = vim.fn.fnamemodify(file, ":r")

        local compiler = vim.bo.filetype == "cpp"
                and "clang++"
            or "clang"

        local standard = vim.bo.filetype == "cpp"
                and "-std=c++20"
            or "-std=c17"

        local command = table.concat({
            compiler,
            standard,
            "-Wall",
            "-Wextra",
            "-Wpedantic",
            "-g",
            shellescape(file),
            "-o",
            shellescape(output),
        }, " ")

        run_in_terminal(command, root)
        return
    end

    notify(
        "Build coomand is only configured for C, C++ and Rust",
        vim.log.levels.WARN
    )
end

-- Run
function M.run()
    local kind = project_type()

    if kind == "rust" then
        run_in_terminal("cargo run", rust_root())
        return
    end

    if kind == "c" then
        local root = c_root()

        if has_file(root, { "Makefile", "makefile" }) then
            notify(
                "For C projects with Makefile use: :Task make run",
                vim.log.levels.INFO
            )
            return
        end

        local file = current_file()

        if not file then
            notify("No C file opened", vim.log.levels.WARN)
            return
        end

        local output = vim.fn.fnamemodify(file, ":r")

        local compiler = vim.bo.filetype == "cpp"
                and "clang++"
            or "clang"

        local standard = vim.bo.filetype == "cpp"
                and "-std=c++20"
            or "-std=c17"

        local command = table.concat({
            compiler,
            standard,
            "-Wall",
            "-Wextra",
            "-Wpedantic",
            "-g",
            shellescape(file),
            "-o",
            shellescape(output),
            "&&",
            shellescape(output),
        }, " ")

        run_in_terminal(command, root)
        return
    end

    notify(
        "Run command is only configured for C, C++ and Rust",
        vim.log.levels.WARN
    )
end

-- Test
function M.test()
    local kind = project_type()

    if kind == "rust" then
        run_in_terminal("cargo test", rust_root())
        return
    end

    if kind == "c" then
        local root = c_root()

        if has_file(root, { "Makefile", "makefile" }) then
            run_in_terminal("make test", root)
            return
        end

        notify(
            "C project needs target 'test' in the Makefile",
            vim.log.levels.WARN
        )
        return
    end

    notify(
        "The test command is only configured for C, C++ and Rust",
        vim.log.levels.WARN
    )
end

-- Arbitrary command
function M.task(command)
    if not command or command == "" then
        notify("You need to initalize a command", vim.log.levels.WARN)
        return
    end

    local root

    if project_type() == "rust" then
        root = rust_root()
    else
        root = c_root()
    end

    run_in_terminal(command, root)
end

return M
