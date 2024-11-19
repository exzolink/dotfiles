return {
  "mfussenegger/nvim-lint",
  event = "User FilePost",

  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      vue = { "eslint_d" },
    }

    lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
      if diagnostic.message:find("Error: Could not find config file") then
        return nil
      end
      return diagnostic
    end)

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "InsertEnter" }, {
      callback = function() lint.try_lint() end,
    })
  end,
}
