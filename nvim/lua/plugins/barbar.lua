local api = vim.api

local function getNvimTreeWidth()
  for _, win in ipairs(api.nvim_tabpage_list_wins(0)) do
    if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

return {
  "romgrk/barbar.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function() vim.g.barbar_auto_setup = false end,

  opts = {
    animation = false,
    auto_hide = true,
    tabpages = false,
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 24,
    no_name_title = "No Name",

    icons = {
      button = "",
      current = { separator = { right = " " } },
      inactive = { separator = { right = " " } },
      visible = { separator = { right = " " } },
      pinned = { button = "󰐃", filename = true },

      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true },
        [vim.diagnostic.severity.WARN] = { enabled = true },
      },
    },
  },

  config = function(_, opts)
    require("barbar").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      once = true,
      callback = function()
        local tree_loaded, tree_api = pcall(require, "nvim-tree.api")

        if tree_loaded then
          local bar_api = require("barbar.api")
          local Event = tree_api.events.Event

          tree_api.events.subscribe(Event.TreeOpen, function()
            bar_api.set_offset(getNvimTreeWidth())
          end)

          tree_api.events.subscribe(Event.Resize, function()
            bar_api.set_offset(getNvimTreeWidth())
          end)

          tree_api.events.subscribe(Event.TreeClose, function()
            bar_api.set_offset(0)
          end)
        end
      end,
    })
  end,
}
