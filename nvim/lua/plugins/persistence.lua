return {
	"folke/persistence.nvim",
	event = "BufReadPre",

  opts = {
    dir = "/Users/1/.local/state/nvim/sessions",
  },
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
}
