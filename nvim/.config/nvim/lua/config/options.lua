
local opt = vim.opt

-- The interface
opt.number = 		true
opt.relativenumber = 	true
opt.signcolumn = 	"yes"
opt.cursorline = 	true
opt.termguicolors = 	true
opt.wrap = 		false
opt.scrolloff = 	8

-- Indentation
opt.tabstop = 		4
opt.shiftwidth = 	4
opt.softtabstop = 	4
opt.expandtab = 	true
opt.smartindent = 	true

-- Searching
opt.ignorecase = 	true
opt.smartcase = 	true
opt.incsearch = 	true
opt.hlsearch = 		true

-- Windows
opt.splitright = 	true
opt.splitbelow = 	true

-- Archives
opt.undofile = 		true
opt.swapfile = 		false
opt.backup = 		false

-- Performance
opt.updatetime =	250
opt.timeoutlen = 	1000

-- Mouse
opt.mouse = 		"a"


-- Autocomplete
opt.completeopt = {
    "menuone",
    "noselect",
    "popup"
}
