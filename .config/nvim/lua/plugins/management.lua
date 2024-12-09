return {
  -- https://github.com/ahmedkhalf/project.nvim
  -- The superior project management solution for neovim.
  {
    "ahmedkhalf/project.nvim",
    optional = true,
    opts = function(_, opts)
      opts.manual_mode = false
      opts.detection_methods = { "lsp", "pattern" }
      opts.patterns = {
        ".git",
        ".hg",
        ".svn",
      }
    end,
    config = function()
      require("telescope").load_extension("projects")
    end,
  },
}
