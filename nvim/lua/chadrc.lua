-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

--- @type ChadrcConfig

local M = {}

M.base46 = {
	theme = "catppuccin",

	hl_add = {
		DiagnosticUnderlineError = {
			special = "orange",
			underline = true,
		},
		NvimTreeDiagnosticErrorFileHL = {
			fg = "red",
		},
		NvimTreeDiagnosticWarnFileHL = {
			fg = "yellow",
		},
		NvimTreeDiagnosticInfoFileHL = {
			fg = "green",
		},
		NvimTreeDiagnosticHintFileHL = {
			fg = "purple",
		},
	},
}

M.ui = {
	statusline = {
		theme = "vscode_colored",
		modules = require("custom.statusline"),
	},

	tabufline = {
		lazyload = false,
	},
}

return M
