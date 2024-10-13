local M = {}

local map = vim.keymap.set

M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP: " .. desc }
  end

  local builtin = require("telescope.builtin")
  local code_action = client.server_capabilities.codeActionProvider

  if type(code_action) == "table" then
    local code_action_kinds = vim.b[bufnr]._code_action_kinds or {}
    vim.b[bufnr]._code_action_kinds = vim.tbl_extend("force", code_action_kinds, code_action.codeActionKinds or {})
  end

  map("n", "gd", builtin.lsp_definitions, opts("Goto definition"))
  map("n", "gD", vim.lsp.buf.declaration, opts("Goto declaration"))
  map("n", "gR", builtin.lsp_references, opts("Goto references"))
  map("n", "gi", builtin.lsp_implementations, opts("Goto implementation"))
  map("n", "<leader>D", builtin.lsp_type_definitions, opts("Goto type definition"))
  map("n", "<leader>ds", builtin.lsp_document_symbols, opts("Document symbols"))
  map("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, opts("Workspace symbols"))
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
  map("n", "<leader>ra", require("nvchad.lsp.renamer"), opts("Rename"))

  map({ "n", "v" }, "<leader>ca", function()
    vim.lsp.buf.code_action({ context = { only = vim.b[bufnr]._code_action_kinds } })
  end, opts("Code action"))

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))

  if client.supports_method("textDocument/documentHighlight") then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  if client.supports_method("textDocument/inlayHint") then
    if vim.bo[bufnr].filetype ~= "vue" then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    map("n", "<leader>tt", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
    end, opts("Toggle inlay hints"))
  end

  if client.supports_method("textDocument/codeLens") then
    vim.api.nvim_create_autocmd({ "BufWinEnter", "CursorHold", "InsertLeave" }, {
      buffer = bufnr,
      callback = vim.lsp.codelens.refresh,
    })
  end

  if client.supports_method("textDocument/documentSymbol") then
    if not (vim.bo[bufnr].filetype == "vue" and client.name == "vtsls") then
      require("nvim-navic").attach(client, bufnr)
    end
  end
end

M.overrides = function()
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = nil
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end
end

return M
