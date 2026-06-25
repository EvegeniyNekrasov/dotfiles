vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.conceallevel = 2

require("config.options")
require("config.keymaps")
require("config.lsp")
require("config.tasks")
require("config.lazy")
