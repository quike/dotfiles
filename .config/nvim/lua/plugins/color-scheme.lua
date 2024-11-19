-- https://github.com/catppuccin/nvim

return {
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          illuminate = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = true,
          },
          mason = true,
          native_lsp = { enabled = true },
          notify = true,
          nvimtree = true,
          neotree = true,
          symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
          mini = {
            enabled = true,
            indentscope_color = "lavender",
          },
        },
      })

      vim.cmd.colorscheme("catppuccin-mocha")

      -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
      -- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      --   vim.api.nvim_set_hl(0, group, {})
      -- end
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
}
