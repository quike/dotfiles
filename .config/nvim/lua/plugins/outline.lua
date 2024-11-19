-- https://github.com/hedyhli/outline.nvim
-- Code outline sidebar powered by LSP. Forked from symbols-outline.nvim.

return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },
}
