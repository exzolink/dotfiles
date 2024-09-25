return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      -- build = "make",
    },
  },

  opts = function(_, opts)
    local options = {
      defaults = {
        layout_config = {
          horizontal = {
            preview_width = 0.6,
          },
          width = math.huge,
          height = math.huge,
        },
      },

      extensions_list = { "themes", "terms", "fzf" },
    }

    return vim.tbl_deep_extend("force", opts, options)
  end,

  keys = {
    { "<leader>sw", "<Cmd>Telescope grep_string<CR>", desc = "telescope search current word" },
    { "<leader>sd", "<Cmd>Telescope diagnostics<CR>", desc = "telescope search diagnostics" },
    { "<leader>sr", "<Cmd>Telescope resume<CR>", desc = "telescope search resume" },
    { "<leader>sh", "<Cmd>Telescope search_history<CR>", desc = "telescope search history" },
  },
}
