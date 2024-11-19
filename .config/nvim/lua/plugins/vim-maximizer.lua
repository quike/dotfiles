-- https://github.com/szw/vim-maximizer
-- Maximizes and restores the current window in Vim.

return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
  },
}
