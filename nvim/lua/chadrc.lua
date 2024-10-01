local M = {}

local colors = {
  dark = { "darker_black", -3 },
  dark_blue = { "black", "nord_blue", 18 },
  dark_teal = { "black", "teal", 18 },
}

M.base46 = {
  theme = "catppuccin",

  integrations = {
    "rainbowdelimiters",
    "trouble",
    "dap",
  },

  hl_add = {
    InputBorder = { fg = colors.dark, bg = colors.dark },
    DiagnosticUnderlineError = { special = "red", undercurl = true },
    GitSignsCurrentLineBlame = { link = "LspInlayHint" },
    TelescopePromptCounter = { fg = "light_grey" },
    UfoFoldedEllipsis = { fg = "nord_blue" },
    CmpItemAbbrDeprecated = { fg = "light_grey" },

    NvimTreeDiagnosticErrorFileHL = { fg = "red" },
    NvimTreeDiagnosticWarnFileHL = { fg = "yellow" },
    NvimTreeDiagnosticInfoFileHL = { fg = "green" },
    NvimTreeDiagnosticHintFileHL = { fg = "purple" },

    TreesitterContext = { bg = "one_bg" },
    TreesitterContextLineNumber = { fg = "grey_fg2", bg = "one_bg" },

    BufferOffset = { bg = "darker_black" },
    BufferTabpageFill = { bg = "darker_black" },
    BufferScrollArrow = { fg = "white", bg = "darker_black", bold = true },
    BufferCurrent = { fg = "purple", bg = "darker_black" },
    BufferVisible = { link = "BufferCurrent" },
    BufferInactive = { fg = "light_grey", bg = "darker_black" },
    BufferCurrentTarget = { fg = "red", bg = "darker_black", bold = true },
    BufferVisibleTarget = { link = "BufferCurrentTarget" },
    BufferInactiveTarget = { link = "BufferCurrentTarget" },
    BufferCurrentSign = { fg = "purple", bg = "darker_black" },
    BufferVisibleSign = { fg = "white", bg = "darker_black" },
    BufferInactiveSign = { fg = "black", bg = "darker_black" },
    BufferCurrentMod = { fg = "yellow", bg = "darker_black" },
    BufferVisibleMod = { link = "BufferCurrentMod" },
    BufferInactiveMod = { link = "BufferInactive" },
    BufferCurrentERROR = { fg = "orange", bg = "darker_black" },
    BufferVisibleERROR = { link = "BufferCurrentERROR" },
    BufferInactiveERROR = { link = "BufferInactive" },
    BufferCurrentWARN = { fg = "sun", bg = "darker_black" },
    BufferVisibleWARN = { link = "BufferCurrentWARN" },
    BufferInactiveWARN = { link = "BufferInactive" },
  },

  hl_override = {
    NormalFloat = { bg = colors.dark },
    WinSeparator = { link = "NvimTreeWinSeparator" },
    CursorLineNr = { fg = "purple", bold = true },
    LspInlayHint = { fg = "grey_fg2", bg = "NONE" },

    LspReferenceText = { fg = "NONE", bg = colors.dark_teal },
    LspReferenceRead = { fg = "NONE", bg = colors.dark_teal },
    LspReferenceWrite = { fg = "NONE", bg = colors.dark_teal },

    FoldColumn = { fg = "light_grey", bg = "NONE" },
    Folded = { bg = colors.dark_blue },

    TelescopeNormal = { link = "NormalFloat" },
    TelescopeBorder = { fg = colors.dark, bg = colors.dark },
    TelescopeResultsTitle = { link = "TelescopeBorder" },
    RenamerBorder = { link = "InputBorder" },

    PmenuSel = { fg = "black", bg = "blue" },
    CmpPmenu = { bg = "one_bg2" },
    CmpBorder = { fg = "one_bg2", bg = "one_bg2" },
    CmpDoc = { link = "NormalFloat" },
    CmpDocBorder = { fg = colors.dark, bg = colors.dark },

    -- ["@ibl.scope.underline.1"] = { bg = { "black", "red", 10 } },
    -- ["@ibl.scope.underline.2"] = { bg = { "black", "yellow", 10 } },
    -- ["@ibl.scope.underline.3"] = { bg = { "black", "blue", 10 } },
    -- ["@ibl.scope.underline.4"] = { bg = { "black", "orange", 10 } },
    -- ["@ibl.scope.underline.5"] = { bg = { "black", "green", 10 } },
    -- ["@ibl.scope.underline.6"] = { bg = { "black", "purple", 10 } },
    -- ["@ibl.scope.underline.7"] = { bg = { "black", "cyan", 10 } },
  },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
    modules = require("custom.statusline"),
  },

  cmp = {
    style = "flat_dark",
    format_colors = {
      tailwind = true,
    },
  },

  tabufline = {
    enabled = false,
    lazyload = false,
  },
}

M.mason = {
  pkgs = {
    "html-lsp",
    "css-lsp",
    "prettier",
    "eslint_d",
    "vue-language-server",
    "vtsls",
    "emmet-language-server",
    "prisma-language-server",
    "tailwindcss-language-server",
    "json-lsp",
    "yaml-language-server",
  },
}

return M
