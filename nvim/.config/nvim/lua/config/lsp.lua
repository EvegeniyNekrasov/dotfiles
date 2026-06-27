-- Diagnostics
vim.diagnostic.config({
    underline = true,
    signs = true,
    severity_sort = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 2,
        source = "if_many"
    },
    float = {
        border = "rounded",
        source = true
    }
})


-- Configuration for conected LSP server
local lsp_group = vim.api.nvim_create_augroup("user-lsp", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_group,

    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

        local function map(keys, action, description)
            vim.keymap.set("n", keys, action, {
                buffer = event.buf,
                silent = true,
                desc = "LSP: " .. description
            })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("K", vim.lsp.buf.hover, "Show documentation")

        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code actions")

        map("<leader>e", function() 
            vim.diagnostics.open_float({ border = "rounded" })
        end, "Show diagnostic")

        map("<leader>f", function() 
            vim.lsp.buf.format({
                bufnr = event.buf,
                async = false,
                timeout_ms = 2000
            })
        end, "Format archive")
        
        -- Native nvim autocomplete
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(
                true,
                client.id,
                event.buf,
                {
                    autotrigger = true
                }
            )
        end

        -- Formatting on save
        if client:supports_method("textDocument/formatting") then
            local format_group = vim.api.nvim_create_augroup(
                "user-lsp-format" .. event.buf,
                { clear = true }
            )

            vim.api.nvim_create_autocmd("BufWritePre", {
                group = fromat_group,
                buffer = event.buf,

                callback = function(args) 
                    vim.lsp.buf.format({
                        bufnr = args.buf,
                        id = client.id,
                        async = false,
                        timeout_ms = 2000
                    })
                end
            })  
        end
    end
})


-- Activate servers
vim.lsp.enable({ 
    "clangd", 
    "rust_analyzer",
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "lua_ls"
})


