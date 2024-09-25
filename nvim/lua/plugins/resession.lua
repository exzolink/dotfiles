return {
  "stevearc/resession.nvim",

  opts = {
    autosave = {
      enabled = true,
      interval = 60,
      notify = false,
    },
  },

  keys = {
    { "<leader>ss", function() require("resession").save() end, desc = "Save session" },
    { "<leader>sl", function() require("resession").load() end, desc = "Load session" },
    { "<leader>sD", function() require("resession").delete() end, desc = "Delete session" },
  },
}
