require("nvchad.mappings")

local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "Command mode" })

-- Horizontal mouse scrolling
map("n", "<S-ScrollWheelDown>", "6zl", opts())
map("n", "<S-ScrollWheelUp>", "6zh", opts())
map("i", "<S-ScrollWheelDown>", "<C-o>$", opts())
map("i", "<S-ScrollWheelUp>", "<C-o>^", opts())

-- Bufferline (barbar)
map("n", "<tab>", "<Cmd>BufferNext<CR>", opts("Next buffer"))
map("n", "<S-tab>", "<Cmd>BufferPrevious<CR>", opts("Previous buffer"))
map("n", "<leader>x", "<Cmd>BufferClose<CR>", opts("Close buffer"))
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts("Move buffer right"))
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts("Move buffer left"))
map("n", "<A-1>", "<Cmd>BufferPick<CR>", opts("Buffer picker"))

-- Windows
map("n", "<LeftDrag>", function()
  local win = vim.api.nvim_get_current_win()
  local winconf = vim.api.nvim_win_get_config(win)

  if winconf.relative ~= "" then
    local pos = vim.fn.getmousepos()

    vim.api.nvim_win_set_config(win, {
      relative = "editor",
      row = pos.screenrow - 1,
      col = pos.screencol - 1,
    })
  end
end)

map("n", "<C-LeftDrag>", function()
  local win = vim.api.nvim_get_current_win()
  local winconf = vim.api.nvim_win_get_config(win)

  if winconf.relative ~= "" then
    local pos = vim.fn.getmousepos()

    vim.api.nvim_win_set_width(win, pos.screencol - winconf.col)
    vim.api.nvim_win_set_height(win, pos.screenrow - winconf.row)
  end
end)
