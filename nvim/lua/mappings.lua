require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "Command mode" })

-- horizontal mouse scrolling
map("n", "<S-ScrollWheelDown>", "6zl", { noremap = true, silent = true })
map("n", "<S-ScrollWheelUp>", "6zh", { noremap = true, silent = true })
map("i", "<S-ScrollWheelDown>", "<C-o>$", { noremap = true, silent = true })
map("i", "<S-ScrollWheelUp>", "<C-o>^", { noremap = true, silent = true })
