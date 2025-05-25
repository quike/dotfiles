return {
  {
    "mason-org/mason.nvim",
    version = "^2.0.0",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^2.0.0",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  }
}
