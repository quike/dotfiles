--stylua: ignore start

local globals = {
  mapleader               = " ",  -- Map leader key to SPC
  maplocalleader          = ",",  -- Map local leader key to comma
  speeddating_no_mappings = 1,    -- Disable default mappings for speeddating
  loaded_matchparen       = true, -- Enable brackets match line
  loaded_matchbracket     = true, -- Enable brackets match line
  elite_mode              = true, -- Enable elite-mode (hjkl mode. arrow-keys resize window)
  window_q_mapping        = true, -- When enabled, 'q' closes any window
}

local options = {
  number         = true, -- set line numbers -- set line numbers (opt.nu)
  relativenumber = true, -- use relative line numbers (opt.rnu)
  tabstop        = 2,
  softtabstop    = 2,
  expandtab      = true,
  smartindent    = true,
  shiftwidth     = 2,
  breakindent    = true,
  wildignore     = "*node_modules/**", -- Don't search inside Node.js modules (works for gutentag)
  wrap           = false,
  writebackup    = false,              -- Not needed
  splitbelow     = true,               -- Prefer windows splitting to the right
  splitright     = true,               -- Prefer windows splitting to the bottom
  mouse          = "a",                -- Enable mouse mode
  mousescroll    = 'ver:25,hor:6',     -- Customize mouse scroll
  ignorecase     = true,
  smartcase      = true,
  updatetime     = 50,
  completeopt    = { "menuone", "noselect", "noinsert" },
  undofile       = true,
  termguicolors  = true, -- Enable 24-bit color
  signcolumn     = "yes",
  clipboard      = "unnamed,unnamedplus",
  cursorline     = true,
  cursorlineopt  = "number",
  foldmethod     = 'indent', -- Set 'indent' folding method
  foldcolumn     = "0",
  foldlevel      = 99,
  foldlevelstart = 99,
  foldenable     = true,
  scrolloff      = 8,
  colorcolumn    = "120",
  belloff        = "all",              -- Never ring the unwanted bell,
  autoindent     = true,               -- Good auto indent
  backspace      = "indent,eol,start", -- Making sure backspace works
  backup         = false,              -- Recommended by coc
  conceallevel   = 2,
  concealcursor  = "",                 -- Set to an empty string to expand tailwind class when on cursorline
  encoding       = "utf-8",            -- The encoding displayed
  errorbells     = false,              -- Disables sound effect for errors
  fileencoding   = "utf-8",            -- The encoding written to file
  incsearch      = true,               -- Start searching before pressing enter. Enable incrementar searching.
  hlsearch       = true,
  showmode       = false,              -- Don't show things like -- INSERT -- anymore
}

for k, v in pairs(globals) do
  vim.g[k] = v
end

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.guicursor = {
  "n-v-c:block",                                  -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25",                                -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20",                                   -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50",                                      -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250",        -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
