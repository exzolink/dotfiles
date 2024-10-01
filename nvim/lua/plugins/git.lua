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

      on_attach = function(bufnr)
        local function opts(desc)
          return { buffer = bufnr, desc = "Git: " .. desc }
        end

        local gitsigns = require("gitsigns")
        local map = vim.keymap.set

        map("n", "<leader>rh", gitsigns.reset_hunk, opts("Reset Hunk"))
        map("n", "<leader>ph", gitsigns.preview_hunk, opts("Preview Hunk"))
        map("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, opts("Blame Line"))
      end,
    },
  },
}
