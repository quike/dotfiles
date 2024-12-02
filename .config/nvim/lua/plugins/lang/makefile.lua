return {
  -- https://github.com/sopa0/telescope-makefile
  {
    "sopa0/telescope-makefile",
  },
  { -- This plugin
    "Zeioth/makeit.nvim",
    cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
  },
}
