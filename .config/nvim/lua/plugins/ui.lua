if true then
  return {}
end

return {
  -- catppuccin
  -- {
  -- "catppuccin/nvim",
  -- name = "catppuccin",
  -- enabled = true,
  -- config = function()
  -- require("catppuccin").setup({
  -- flavour = "mocha", -- latte, frappe, macchiato, mocha
  -- })
  -- end,
  -- },

  -- project
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
