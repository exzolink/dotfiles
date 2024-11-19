require("nvchad.options")

local opt = vim.opt

-- General options
opt.sessionoptions = { "buffers", "curdir", "folds", "help", "tabpages", "winsize", "terminal", "globals" }
opt.mousescroll = { "ver:6", "hor:6" }
opt.sidescrolloff = 6
opt.scrolloff = 6
opt.wrap = false
opt.timeoutlen = 400
opt.updatetime = 200
opt.cursorlineopt = "both"
opt.relativenumber = true
opt.swapfile = false

-- Fold options
opt.foldcolumn = "1"
opt.fillchars = "eob: ,fold: ,foldopen:,foldsep: ,foldclose:"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
