return {
  --- Mini stuffs
  {
    "echasnovski/mini.nvim",
    name = "mini",
    version = false,
    config = function()
      require("mini.animate").setup()
    end,
  },
}
