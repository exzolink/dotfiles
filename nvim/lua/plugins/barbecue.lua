return {
	{
		"utilyre/barbecue.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				"SmiteshP/nvim-navic",
				opts = {
					lazy_update_context = true,
				},
			},
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			vim.g.navic_silence = true

			require("barbecue").setup({
				create_autocmd = false,

				theme = {
					basename = { bold = false },
				},
			})

			vim.api.nvim_create_autocmd({
				"WinResized",
				"BufWinEnter",
				"CursorHold",
				"InsertLeave",
			}, {
				group = vim.api.nvim_create_augroup("barbecue.updater", {}),
				callback = function()
					require("barbecue.ui").update()
				end,
			})
		end,
	},
}
