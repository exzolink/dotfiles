local M = {}

local colors = {
	dark = { "darker_black", -3 },
}

M.base46 = {
	theme = "catppuccin",

	integrations = {
		"rainbowdelimiters",
		"trouble",
		"dap",
		"codeactionmenu",
	},

	hl_add = {
		DiagnosticUnderlineError = { special = "red", undercurl = true },
		GitSignsCurrentLineBlame = { link = "LspInlayHint" },
		TelescopePromptCounter = { fg = "light_grey" },
		UfoFoldedEllipsis = { fg = "nord_blue" },

		NvimTreeDiagnosticErrorFileHL = { fg = "red" },
		NvimTreeDiagnosticWarnFileHL = { fg = "yellow" },
		NvimTreeDiagnosticInfoFileHL = { fg = "green" },
		NvimTreeDiagnosticHintFileHL = { fg = "purple" },

		TreesitterContext = { bg = "one_bg" },
		TreesitterContextLineNumber = { fg = "grey_fg2", bg = "one_bg" },

		BufferOffset = { bg = "darker_black" },
		BufferTabpageFill = { bg = "darker_black" },
		BufferScrollArrow = { fg = "white", bg = "darker_black", bold = true },
		BufferCurrent = { fg = "purple", bg = "darker_black" },
		BufferVisible = { link = "BufferCurrent" },
		BufferInactive = { fg = "light_grey", bg = "darker_black" },
		BufferCurrentTarget = { fg = "red", bg = "darker_black", bold = true },
		BufferVisibleTarget = { link = "BufferCurrentTarget" },
		BufferInactiveTarget = { link = "BufferCurrentTarget" },
		BufferCurrentSign = { fg = "purple", bg = "darker_black" },
		BufferVisibleSign = { link = "BufferCurrentSign" },
		BufferInactiveSign = { fg = "black", bg = "darker_black" },
		BufferCurrentMod = { fg = "yellow", bg = "darker_black" },
		BufferVisibleMod = { link = "BufferCurrentMod" },
		BufferInactiveMod = { link = "BufferInactive" },
	},

	hl_override = {
		NormalFloat = { bg = colors.dark },
		WinSeparator = { link = "NvimTreeWinSeparator" },
		CursorLineNr = { fg = "purple", bold = true },
		LspInlayHint = { fg = "grey_fg2", bg = "NONE" },

		FoldColumn = { fg = "light_grey", bg = "NONE" },
		Folded = { bg = { "black", "nord_blue", 18 } },

		TelescopeNormal = { link = "NormalFloat" },
		TelescopeBorder = { fg = colors.dark, bg = colors.dark },
		TelescopeResultsTitle = { link = "TelescopeBorder" },

		CmpDoc = { link = "NormalFloat" },
		CmpDocBorder = { fg = colors.dark, bg = colors.dark },

		["@ibl.scope.underline.1"] = { bg = { "black", "red", 10 } },
		["@ibl.scope.underline.2"] = { bg = { "black", "yellow", 10 } },
		["@ibl.scope.underline.3"] = { bg = { "black", "blue", 10 } },
		["@ibl.scope.underline.4"] = { bg = { "black", "orange", 10 } },
		["@ibl.scope.underline.5"] = { bg = { "black", "green", 10 } },
		["@ibl.scope.underline.6"] = { bg = { "black", "purple", 10 } },
		["@ibl.scope.underline.7"] = { bg = { "black", "cyan", 10 } },
	},
}

M.ui = {
	statusline = {
		theme = "vscode_colored",
		modules = require("custom.statusline"),
	},

	tabufline = {
		enabled = false,
		lazyload = false,
	},
}

return M
