return {
  --- Mini stuffs
  {
    "nvim-mini/mini.nvim",
    name = "mini",
    version = false,
    config = function()
      require("mini.animate").setup()
    end,
  },
}
