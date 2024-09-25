return {
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function() require("configs.lsp") end,
  },
  { "b0o/schemastore.nvim" },
}
