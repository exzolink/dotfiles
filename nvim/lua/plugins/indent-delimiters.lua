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
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
		{
			"HiPhish/rainbow-delimiters.nvim",
			config = function()
				dofile(vim.g.base46_cache .. "rainbowdelimiters")

				require("rainbow-delimiters.setup").setup({
					highlight = highlight,
					blacklist = { "html", "vue" },
				})
			end,
		},
	},

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
}
