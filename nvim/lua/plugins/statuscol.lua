return {
  "luukvbaal/statuscol.nvim",
  lazy = false,

  opts = function()
    local builtin = require("statuscol.builtin")

    return {
      relculright = true,
      ft_ignore = { "NvimTree" },
      segments = {
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { text = { " ", builtin.foldfunc, " " }, click = "v:lua.ScFa" },
      },
    }
  end,
}
