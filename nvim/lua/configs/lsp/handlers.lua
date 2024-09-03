local M = {}

M.setup_inlay_hints = function(client, bufnr)
	if client.supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

return M
