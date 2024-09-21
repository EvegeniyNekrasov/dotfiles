return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'cssls',
          'tailwindcss',
          'html',
          'lua_ls',
          'ts_ls',
          'tsp_server',
          'biome'
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- creating a lspconfig
      local lspconfig = require("lspconfig")
      -- settingup lspservers
      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.html.setup({})
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.tsp_server.setup({})
      lspconfig.biome.setup({})
      -- adding keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
