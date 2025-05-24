local function open_menu(is_mouse)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "NvMenu" then
      vim.api.nvim_win_close(win, true)
    end
  end

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = is_mouse })
  vim.o.mousemev = false
end

return {
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
  },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
    keys = { { "<C-t>", "<Cmd>Huefy<CR>", desc = "Color picker" } },
  },
  {
    "nvzone/menu",
    keys = {
      { "<A-t>", function() open_menu(false) end, desc = "Open menu" },
      { "<RightMouse>", mode = { "n", "x" }, function() open_menu(true) end, desc = "Open menu" },
    },
  },
}
