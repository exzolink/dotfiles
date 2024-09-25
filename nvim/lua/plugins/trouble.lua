return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function() dofile(vim.g.base46_cache .. "trouble") end,
	opts = {},

	keys = {
		{ "<A-z>", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		{ "<A-x>", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
		{ "<A-q>", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
	},
}
