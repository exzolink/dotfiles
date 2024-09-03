require("nvchad.options")

local opt = vim.opt

opt.sessionoptions = { "buffers", "curdir", "folds", "help", "tabpages", "winsize", "terminal", "globals" }
opt.mousescroll = { "ver:6", "hor:6" }
opt.sidescrolloff = 6
opt.scrolloff = 6
opt.wrap = false
opt.timeoutlen = 300
opt.cursorlineopt = "both"
opt.relativenumber = true
opt.swapfile = false
