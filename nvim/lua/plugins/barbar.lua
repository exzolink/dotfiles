return {
	"romgrk/barbar.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-tree.lua",
		"nvim-tree/nvim-web-devicons",
	},
	init = function() vim.g.barbar_auto_setup = false end,

	config = function()
		require("barbar").setup({
			tabpages = false,
			maximum_padding = 1,
			minimum_padding = 1,
			maximum_length = 24,
			no_name_title = "Unknown",
			highlight_visible = false,

			icons = {
				separator = { right = " " },
				inactive = { button = "󰅖", separator = { right = " " } },

				diagnostics = {
					[vim.diagnostic.severity.ERROR] = { enabled = true },
					[vim.diagnostic.severity.WARN] = { enabled = true },
				},
			},
		})

		local api = vim.api
		local bar_api = require("barbar.api")
		local tree_api = require("nvim-tree.api")
		local Event = tree_api.events.Event

		local function getNvimTreeWidth()
			for _, win in pairs(api.nvim_tabpage_list_wins(0)) do
				if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
					return api.nvim_win_get_width(win) + 1
				end
			end
			return 0
		end

		tree_api.events.subscribe(Event.TreeOpen, function()
			bar_api.set_offset(getNvimTreeWidth())
		end)

		tree_api.events.subscribe(Event.TreeClose, function()
			bar_api.set_offset(0)
		end)
	end,
}
