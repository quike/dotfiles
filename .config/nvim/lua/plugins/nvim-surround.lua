-- https://github.com/kylechui/nvim-surround
--  Add/change/delete surrounding delimiter pairs with ease.

return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}
