return {
	"utilyre/barbecue.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "SmiteshP/nvim-navic", opts = { lazy_update_context = true } },
	},

	opts = {
		attach_navic = false,
		create_autocmd = false,
		theme = { basename = { bold = false } },
	},
	
	config = function(_, opts)
		require("barbecue").setup(opts)

		vim.api.nvim_create_autocmd({
			"WinResized",
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function() require("barbecue.ui").update() end,
		})
	end,
}
