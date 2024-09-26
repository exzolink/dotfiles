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

    config = function() require("telescope").load_extension("lazygit") end,

    keys = {
      { "<leader>lg", "<Cmd>LazyGit<CR>", desc = "LazyGit" },
      { "<leader>lG", "<Cmd>Telescope lazygit<CR>", desc = "LazyGit repositories" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",

    opts = {
      current_line_blame = true,
      preview_config = {
        border = { { " ", "InputBorder" } },
      },
    },
  },
}
