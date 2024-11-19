-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local globals = {
  mapleader = " ", --- Map leader key to SPC
  maplocalleader = ",", --- Map local leader key to comma
  speeddating_no_mappings = 1, --- Disable default mappings for speeddating
  loaded_matchparen = true, -- Enable brackets match line
  loaded_matchbracket = true, -- Enable brackets match line
  elite_mode = true, -- Enable elite-mode (hjkl mode. arrow-keys resize window)
  window_q_mapping = true, -- When enabled, 'q' closes any window
}

local options = {
  nu = true,
  rnu = true,
  -- Set tabs to 2 spaces
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,
  -- Enable auto indenting and set it to spaces
  smartindent = true,
  shiftwidth = 2,
  -- Enable smart indenting
  breakindent = true,
  wildignore = "*node_modules/**", --- Don't search inside Node.js modules (works for gutentag)
  -- Disable text wrap
  wrap = false,
  writebackup = false, --- Not needed
  -- Better splitting
  splitbelow = true, -- Prefer windows splitting to the right
  splitright = true, -- Prefer windows splitting to the bottom
  -- Enable mouse mode
  mouse = "a",
  -- Enable ignorecase + smartcase for better searching
  ignorecase = true,
  smartcase = true,
  -- Decrease updatetime for faster completion.
  updatetime = 50,
  -- Set completeopt to have a better completion experience
  completeopt = { "menuone", "noselect", "noinsert" },
  -- Enable persistent undo history
  undofile = true,
  termguicolors = true, -- Enable 24-bit color
  -- Enable the sign column to prevent the screen from jumping
  signcolumn = "yes",
  -- Enable access to System Clipboard
  clipboard = "unnamed,unnamedplus",
  -- Enable cursor line highlight
  cursorline = true,
  cursorlineopt = "number",
  -- Set fold settings
  -- These options were reccommended by nvim-ufo
  -- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
  foldcolumn = "0",
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
  -- Always keep 8 lines above/below cursor unless at start/end of file
  scrolloff = 8,
  -- Place a column line
  colorcolumn = "120",
  -- Miscellaneous
  belloff = "all", -- Never ring the unwanted bell,
  -- Neovim defaults
  autoindent = true, --- Good auto indent
  backspace = "indent,eol,start", --- Making sure backspace works
  backup = false, --- Recommended by coc
  --- Concealed text is completely hidden unless it has a custom replacement character defined (needed for dynamically showing tailwind classes)
  conceallevel = 2,
  concealcursor = "", --- Set to an empty string to expand tailwind class when on cursorline
  encoding = "utf-8", --- The encoding displayed
  errorbells = false, --- Disables sound effect for errors
  fileencoding = "utf-8", --- The encoding written to file
  incsearch = true, --- Start searching before pressing enter. Enable incrementar searching.
  hlsearch = true,
  showmode = false, --- Don't show things like -- INSERT -- anymore
}

for k, v in pairs(globals) do
  vim.g[k] = v
end

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.guicursor = {
  "n-v-c:block", -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
