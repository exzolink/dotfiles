return {
  setup = function(on_attach, on_init, capabilities)
    vim.lsp.enable("tailwindcss")

    vim.lsp.config("tailwindcss", {
      on_attach = on_attach,
      on_init = on_init,
      capabilities = capabilities,

      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              "\\/\\*\\s*tw\\s*\\*\\/\\s*[`'\"](.*)[`'\"];?",
              "@tw\\s\\*/\\s+[\"'`]([^\"'`]*)",
              { "(?:twMerge|twJoin)\\(([^\\);]*)[\\);]", "[`'\"]([^'\"`,;]*)[`'\"]" },
              "twc\\`(.*)\\`;?",
              "(?:clsx|cva|cn)[`]([\\s\\S][^`]*)[`]",
              { "(?:clsx|cva|cn)\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              { "ui:\\s*{([^)]*)\\s*}", "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "/\\*\\s?ui\\s?\\*/\\s*{([^;]*)}", ":\\s*[\"'`]([^\"'`]*).*?[\"'`]" },
              "class\\s*:\\s*[\"'`]([^\"'`]*)[\"'`]",
              { "classList.(?:add|remove)\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
              { "Styles\\s*(?::\\s*[^=]+)?\\s*=\\s*([^;]*);", "['\"`]([^'\"`]*)['\"`]" },
              "(?:enter|leave)(?:From|To)?=\\s*(?:\"|'|{`)([^(?:\"|'|`})]*)",
            },
          },
          classAttributes = {
            "class",
            "className",
            "class:list",
            "classList",
            "ngClass",
            "ui",
          },
        },
      },
      filetypes = { "html", "scss", "css", "sass", "less", "javascriptreact", "typescriptreact", "vue" },
    })
  end,
}
