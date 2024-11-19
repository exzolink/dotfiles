return {
  "nvim-tree/nvim-tree.lua",

  opts = {
    select_prompts = true,

    view = {
      debounce_delay = 50,
      width = {
        min = 36,
        max = 40,
        padding = 0,
      },
    },

    renderer = {
      highlight_diagnostics = "name",
    },

    diagnostics = {
      enable = true,
      severity = {
        min = vim.diagnostic.severity.WARN,
        max = vim.diagnostic.severity.ERROR,
      },
    },

    filesystem_watchers = {
      debounce_delay = 250,
    },
  },
}
