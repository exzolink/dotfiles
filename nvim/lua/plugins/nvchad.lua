return {
  {
    "nvchad/showkeys",
    cmd = "ShowkeysToggle",
  },
  {
    "nvchad/minty",
    cmd = { "Shades", "Huefy" },
    keys = { { "<C-t>", "<Cmd>Huefy<CR>", desc = "Color picker" } },
  },
  {
    "nvchad/menu",
    keys = {
      { "<A-t>", function() require("menu").open("default") end, desc = "Open menu" },
      {
        "<RightMouse>",
        function()
          vim.cmd.exec('"normal! \\<RightMouse>"')

          local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
          require("menu").open(options, { mouse = true })
        end,
      },
    },
  },
}
