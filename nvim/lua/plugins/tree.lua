return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",

	opts = {
		view = {
			width = {
				min = 36,
				max = 40,
			},
		},

		renderer = {
			highlight_diagnostics = "name",
		},

		diagnostics = {
			enable = true,

			severity = {
				min = vim.diagnostic.severity.WARN,
				max = vim.diagnostic.severity.ERROR,
			},
		},

		filesystem_watchers = {
			debounce_delay = 250,
		},
	},
}
