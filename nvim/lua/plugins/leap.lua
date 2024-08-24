return {
	"ggandor/leap.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },

	config = function()
		require("leap").add_default_mappings(true)
	end,
}
