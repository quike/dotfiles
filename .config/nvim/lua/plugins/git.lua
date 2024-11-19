return {

  -- https://github.com/tpope/vim-fugitive
  {
    "tpope/vim-fugitive",
  },

  -- https://github.com/lewis6991/gitsigns.nvim
  {
    "lewis6991/gitsigns.nvim",
    name = "gitsigns",
    config = function()
      require("gitsigns").setup()

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end,
  },

  -- https://github.com/kdheepak/lazygit.nvim
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
    },
  },

  -- https://github.com/FabijanZulj/blame.nvim
  -- Neovim fugitive style git blame plugin
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end,
    cmd = "ToggleBlame",
    keys = {
      { "<leader>gb", "<cmd>BlameToggle virtual<CR>", desc = "Git blame" },
      { "<leader>gB", "<cmd>BlameToggle window<CR>", desc = "Git blame (window)" },
    },
    opts = {
      date_format = "%Y-%m-%d %H:%M",
      merge_consecutive = false,
      max_summary_width = 30,
      mappings = {
        commit_info = "K",
        stack_push = ">",
        stack_pop = "<",
        show_commit = "<CR>",
        close = { "<Esc>", "q" },
      },
    },
  },

  -- https://github.com/sindrets/diffview.nvim
  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  {
    "sindrets/diffview.nvim",
    lazy = true,
    enabled = true,
    event = "BufRead",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<Leader>gd", "<cmd>DiffviewFileHistory %<CR>", desc = "Diff File" },
      { "<Leader>gv", "<cmd>DiffviewOpen<CR>", desc = "Diff View" },
    },
  },

  -- https://github.com/akinsho/git-conflict.nvim
  -- A plugin to visualise and resolve merge conflicts in neovim.
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    event = "BufRead",
    version = "*",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "GitConflictDetected",
        callback = function()
          vim.notify("Conflict detected in " .. vim.fn.expand("<afile>"))
        end,
      })

      require("git-conflict").setup({
        debug = false,
        default_mappings = true, -- disable buffer local mapping created by this plugin
        default_commands = true, -- disable commands created by this plugin
        disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
        list_opener = "copen", -- command or function to open the conflicts list
        highlights = { -- They must have background color, otherwise the default color will be used
          incoming = "DiffText",
          current = "DiffAdd",
        },
      })
    end,
    keys = {
      { "<Leader>gcb", "<cmd>GitConflictChooseBoth<CR>", desc = "choose both" },
      { "<Leader>gcn", "<cmd>GitConflictNextConflict<CR>", desc = "move to next conflict" },
      { "<Leader>gcc", "<cmd>GitConflictChooseOurs<CR>", desc = "choose current" },
      { "<Leader>gcp", "<cmd>GitConflictPrevConflict<CR>", desc = "move to prev conflict" },
      { "<Leader>gci", "<cmd>GitConflictChooseTheirs<CR>", desc = "choose incoming" },
    },
  },

  -- https://github.com/pwntester/octo.nvim
  -- Edit and review GitHub issues and pull requests from the comfort of your favorite editor.
  {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
}
