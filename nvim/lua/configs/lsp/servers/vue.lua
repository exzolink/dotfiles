return {
  setup = function(on_attach, on_init, capabilities)
    vim.lsp.enable("vue_ls")

    vim.lsp.config("vue_ls", {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,
    })
  end,
}
