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
