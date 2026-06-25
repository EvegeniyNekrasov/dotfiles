return {
    "nvim-mini/mini.pick",
    -- use stable version
    version = "*",
    config = function()
        local pick = require("mini.pick")
        pick.setup()

        local function map(keys, action, description)
            vim.keymap.set("n", keys, action, { silent = true, desc = description })
        end

        map("<leader>ff", function() 
            pick.builtin.files()
        end, "Search archives")

        map("<leader>fg", function() 
            if vim.fn.executable("rg") ~= 1 then
                vim.notify(
                    "ripgrep is required for this action. Can be installed via brew install ripgrep",
                    vim.log.levels.WARN
                )
                return
            end

            pick.builtin.grep_live()
        end, "Search for text")

        map("<leader>fb", function() 
            pick.builtin.buffers()
        end, "Search for buffers")

        map("<leader>fh", function() 
            pick.builtin.help()
        end, "Search for help")
    end
}
