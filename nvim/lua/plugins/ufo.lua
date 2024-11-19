return {
  "kevinhwang91/nvim-ufo",
  event = "User FilePost",
  dependencies = { "kevinhwang91/promise-async" },

  opts = function()
    return {
      open_fold_hl_timeout = 0,
      close_fold_kinds_for_ft = { default = { "imports" } },
      preview = {
        win_config = {
          border = "rounded",
          winblend = 0,
        },
        mappings = {
          scrollB = "<C-b>",
          scrollF = "<C-f>",
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "gg",
          jumpBot = "G",
        },
      },

      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local alignLimiter = vim.opt.textwidth["_value"] or vim.api.nvim_win_get_width(0)
        local suffix = " 󰇘 󰧖 " .. (endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        local newVirtText = {}

        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)

          if curWidth + chunkWidth > targetWidth then
            chunkText = truncate(chunkText, targetWidth - curWidth)
            table.insert(newVirtText, { chunkText, chunk[2] })
            break
          end

          table.insert(newVirtText, chunk)
          curWidth = curWidth + chunkWidth
        end

        local rAlignAppndx = math.max(math.min(alignLimiter, width - 1) - curWidth - sufWidth, 0)
        suffix = (" "):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "UfoFoldedEllipsis" })
        return newVirtText
      end,

      provider_selector = function(_, filetype, buftype)
        return (filetype == "" or buftype == "nofile") and "indent" or { "lsp", "indent" }
      end,
    }
  end,

  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    {
      "zZ",
      function()
        if not require("ufo").peekFoldedLinesUnderCursor() then
          vim.lsp.buf.hover()
        end
      end,
      desc = "Preview fold",
    },
  }
}
