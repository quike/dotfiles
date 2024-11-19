-- https://github.com/nvim-treesitter/nvim-treesitter
-- Nvim Treesitter configurations and abstraction layer.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    opts = {
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      ensure_installed = {
        "astro",
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "elixir",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "kdl",
        "kotlin",
        "lua",
        "luadoc",
        "luap",
        "latex",
        "make",
        "markdown",
        "markdown_inline",
        "prisma",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "sql",
        "ssh_config",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- MDX
        vim.filetype.add({
          extension = {
            mdx = "mdx",
          },
        })
        vim.treesitter.language.register("markdown", "mdx")
      end,
    },
  },
}
