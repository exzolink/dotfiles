require("nvchad.mappings")

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "Command mode" })

-- Horizontal mouse scrolling
map("n", "<S-ScrollWheelDown>", "6zl", opts)
map("n", "<S-ScrollWheelUp>", "6zh", opts)
map("i", "<S-ScrollWheelDown>", "<C-o>$", opts)
map("i", "<S-ScrollWheelUp>", "<C-o>^", opts)

-- Bufferline (barbar)
map("n", "<tab>", "<Cmd>BufferNext<CR>", opts)
map("n", "<S-tab>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<leader>x", "<Cmd>BufferClose<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A-1>", "<Cmd>BufferPick<CR>", opts)
