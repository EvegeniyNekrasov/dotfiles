return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		default_file_explorer = true,
		columns = {},
		view_options = {
			show_hidden = true
		},
		win_options = {
			signcolumn = "no"
		}
	},
	keys = {
		{
			"-",
			"<cmd>Oil<CR>",
			desc = "Open Oil"
		}
	}
}
