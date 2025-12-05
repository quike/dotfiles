-- https://github.com/nvim-mini/mini.nvim
-- Library of 40+ independent Lua modules improving Neovim experience with minimal effort

return {
  --- Mini stuffs
  {
    "nvim-mini/mini.nvim",
    name = "mini",
    version = false,
    config = function()
      require("mini.animate").setup()
      require("mini.bracketed").setup()
      require("mini.map").setup()
      require("mini.move").setup()
    end,
  },
}
