return {
  {
    -- https://github.com/tpope/vim-fugitive
    "tpope/vim-fugitive",
  },
  {
    -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end,
  },
}
