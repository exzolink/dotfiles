return {
  setup = function(on_attach, on_init, capabilities)
    vim.lsp.enable("emmet_language_server")

    vim.lsp.config("emmet_language_server", {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,

      filetypes = { "html", "scss", "css", "sass", "less", "pug", "php" },
    })
  end,
}
