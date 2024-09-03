return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },

		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",

		opts = {
			current_line_blame = true,
		},
	},
}
