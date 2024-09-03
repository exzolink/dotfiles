return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",

	opts = {
		log_level = "off",
		keymaps = {
			accept_suggestion = "<A-z>",
			clear_suggestion = "<C-]>",
			accept_word = "<C-j>",
		},
	},
}
