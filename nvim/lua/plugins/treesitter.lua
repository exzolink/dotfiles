return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "html",
        "scss",
        "css",
        "typescript",
        "javascript",
        "vue",
        "tsx",
        "php",
        "git_rebase",
        "gitcommit",
        "git_config",
        "gitattributes",
        "gitignore",
        "diff",
        "twig",
        "json",
        "yaml",
        "toml",
        "query",
        "sql",
        "prisma",
        "java",
        "ini",
        "xml",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,

        disable = function(lang, buf)
          local max_filesize = 200 * 1024 -- 200 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      incremental_selection = {
        enable = true,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = { max_lines = 3 },
  },
}
