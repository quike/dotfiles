-- AutoSession takes advantage of Neovim's existing session management capabilities to provide seamless automatic session management.
-- https://github.com/rmagatti/auto-session

return {
  "rmagatti/auto-session",
  lazy = false,
  config = function()
    require("auto-session").setup({
      log_level = 4,
      auto_restore_last_session = false,
      git_use_branch_name = false,
      -- ⚠️ This will only work if Telescope.nvim is installed
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- Set mapping for searching a session.
      -- ⚠️ This will only work if Telescope.nvim is installed
      vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
        noremap = true,
      }),
    })
  end,
}
