local highlight = {
	"RainbowDelimiterRed",
	"RainbowDelimiterYellow",
	"RainbowDelimiterBlue",
	"RainbowDelimiterOrange",
	"RainbowDelimiterGreen",
	"RainbowDelimiterViolet",
	"RainbowDelimiterCyan",
}

return {
	{
		"lukas-reineke/indent-blankline.nvim",

		opts = {
			scope = {
				highlight = highlight,
			},
		},
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "blankline")

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
			require("ibl").setup(opts)

			dofile(vim.g.base46_cache .. "blankline")
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = { "BufReadPost", "BufNewFile" },

		config = function()
			dofile(vim.g.base46_cache .. "rainbowdelimiters")

			require("rainbow-delimiters.setup").setup({
				highlight = highlight,
				query = {
					html = "rainbow-no-tags",
					vue = "rainbow-no-tags",
					tsx = "rainbow-parens",
				},
			})
		end,
	},
}