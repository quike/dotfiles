-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
-- https://github.com/nvim-lualine/lualine.nvim

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "catppuccin/nvim",
      opt = true,
    },
    options = {
      icons_enabled = true,
    },
  },
}
