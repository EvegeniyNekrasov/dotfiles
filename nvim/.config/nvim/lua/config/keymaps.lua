local map = vim.keymap.set

local default_options = { silent = true }

map("n", "<Esc>", "<cmd>nohlsearch<CR>", default_options)

map("n", "<leader>w", "<cmd>write<CR>", { silent = true, desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>", { silent = true, desc = "Exit window" })

-- Navigation between windows
map("n", "<C-h>", "<C-w>h", { silent = true, desc = "Left window" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Bottom window" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Top window" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "Right window" })

-- Mantein selecction on indentetion
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- Move selected lines
map("v", "J", ":move '>+1<CR>gv=gv", default_options)
map("v", "K", ":move '<-2<CR>gv=gv", default_options)

-- Exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit teminal mode" })

-- Open lazygit in new termianl tab
local function open_lazygit()
	if vim.fn.executable("lazygit") ~= 1 then
		vim.notify("Can't find lazygit executable", vim.log.levels.ERROR)
		return
	end

	vim.cmd("tabnew")
	local lazygit_tab = vim.api.nvim_get_current_tabpage()

	vim.cmd("terminal lazygit")
	local lazygit_buffer = vim.api.nvim_get_current_buf()

	vim.api.nvim_create_autocmd("TermClose", {
		buffer = lazygit_buffer,
		once = true,
		callback = function()
			vim.schedule(function()
				if vim.api.nvim_tabpage_is_valid(lazygit_tab) then
					vim.api.nvim_set_current_tabpage(lazygit_tab)
					vim.cmd("tabclose")
				end
			end)
		end
	})

	vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("Lazygit", open_lazygit, { desc = "Open lazygit" })
map("n", "<leader>gg", open_lazygit, { silent = true, desc = "Open lazygit" })
