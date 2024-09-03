return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.adapters.node2 = {
			type = "executable",
			command = "node-debug2-adapter",
			args = {},
		}

		dap.configurations.typescript = {
			{
				type = "node2",
				name = "node attach",
				request = "attach",
				program = "${file}",
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = "inspector",
			},
		}

		dapui.setup()

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
		vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })
		vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebug [C]lose" })

		dofile(vim.g.base46_cache .. "dap")
	end,
}
