return {
  setup = function(on_attach, on_init, capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.emmet_language_server.setup({
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,

      filetypes = {
        "scss",
        "html",
        "css",
        "sass",
        "less",
        "pug",
      },
    })
  end,
}
