require("nvchad.options")

local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

local function escape(str)
	local escape_chars = [[;,."|\]]
	return vim.fn.escape(str, escape_chars)
end

-- Vim options
vim.opt.sessionoptions = { "buffers", "curdir", "folds", "help", "tabpages", "winsize", "terminal" }
vim.opt.mousescroll = { "ver:6", "hor:6" }
vim.opt.sidescrolloff = 6
vim.opt.wrap = false
vim.opt.timeoutlen = 300

-- Custom options
vim.opt.langmap = vim.fn.join({
	escape(ru_shift) .. ";" .. escape(en_shift),
	escape(ru) .. ";" .. escape(en),
}, ",")
