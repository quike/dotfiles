-- AutoSession takes advantage of Neovim's existing session management capabilities to provide seamless automatic session management.
-- https://github.com/rmagatti/auto-session

return {
  "rmagatti/auto-session",
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    -- log_level = 'debug',
  },
}
