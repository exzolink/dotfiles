local function is_in_start_tag()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()
  if not node then
    return false
  end
  local node_to_check = { "start_tag", "self_closing_tag", "directive_attribute" }
  return vim.tbl_contains(node_to_check, node:type())
end

return {
  "hrsh7th/nvim-cmp",

  opts = function(_, opts)
    local cmp = require("cmp")

    cmp.event:on("menu_closed", function()
      local bufnr = vim.api.nvim_get_current_buf()
      vim.b[bufnr]._vue_ts_cached_is_in_start_tag = nil
    end)

    opts.sources = cmp.config.sources({
      {
        name = "nvim_lsp",
        group_index = 1,

        entry_filter = function(entry, ctx)
          if ctx.filetype ~= "vue" then
            return true
          end

          local bufnr = ctx.bufnr
          local cached_is_in_start_tag = vim.b[bufnr]._vue_ts_cached_is_in_start_tag

          if cached_is_in_start_tag == nil then
            vim.b[bufnr]._vue_ts_cached_is_in_start_tag = is_in_start_tag()
          end
          if vim.b[bufnr]._vue_ts_cached_is_in_start_tag == false then
            return true
          end

          local cursor_before_line = ctx.cursor_before_line

          if cursor_before_line:sub(-1) == "@" then
            return entry.completion_item.label:match("^@")
          elseif cursor_before_line:sub(-1) == ":" then
            return entry.completion_item.label:match("^:")
              and not entry.completion_item.label:match("^:on%-")
          elseif cursor_before_line:sub(-1) == "#" then
            local types = require("cmp.types")
            return entry.completion_item.kind == types.lsp.CompletionItemKind.Method
          else
            return true
          end
        end,
      },
      {
        name = "luasnip",
        group_index = 2,
      },
      {
        name = "buffer",
        group_index = 3,
      },
      {
        name = "path",
        group_index = 4,
      },
    })

    opts.performance = { max_view_entries = 30 }

    return opts
  end,
}
