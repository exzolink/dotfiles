return {
  {
    "nvchad/minty",
    keys = { { "<C-t>", function() require("minty.huefy").open() end, desc = "Color picker" } },
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
