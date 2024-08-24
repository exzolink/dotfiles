return {
	{
		"rbong/vim-flog",
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = { "tpope/vim-fugitive" },
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { desc = "[G]it [B]lame" })
			vim.keymap.set("n", "<leader>gA", ":Git add .<cr>", { desc = "[G]it Add [A]ll" })
			vim.keymap.set("n", "<leader>ga", "Git add", { desc = "[G]it [A]dd" })
			vim.keymap.set("n", "<leader>gc", ":Git commit", { desc = "[G]it [C]ommit" })
			vim.keymap.set("n", "<leader>gp", "Git push", { desc = "[G]it [P]ush" })
		end,
	},
}
