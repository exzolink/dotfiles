local utils = require "nvchad.stl.utils"

local M = {}

M.mode = function()
  if not utils.is_activewin() then
    return ""
  end

  local modes = utils.modes
  local m = vim.api.nvim_get_mode().mode
  -- Default icon: 
  return "%#St_" .. modes[m][2] .. "mode#" .. "   " .. modes[m][1] .. " "
end

return M
