return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function() dofile(vim.g.base46_cache .. "trouble") end,
  opts = {},

  keys = {
    { "<A-z>", "<Cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
    { "<A-x>", "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics" },
    { "<A-q>", "<Cmd>Trouble qflist toggle<CR>", desc = "Quickfix List" },
  },
}
