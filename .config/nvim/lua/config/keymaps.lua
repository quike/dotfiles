-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- DAP
local dap = require("dap")

vim.keymap.set("n", "<F1>", dap.continue, { desc = "dap continue" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "dap step into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "dap step over" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "dap step out" })
vim.keymap.set("n", "<F5>", dap.step_back, { desc = "dap step back" })
vim.keymap.set("n", "<F6>", dap.restart, { desc = "dap restart" })
vim.keymap.set("n", "<F7>", dap.stop, { desc = "dap stop" })

-- Telescope
vim.keymap.set("n", "<leader>s?", function()
  require("telescope.builtin").live_grep({
    search = "",
    additional_args = { "--hidden", "--no-ignore" },
    prompt_title = "Search (hidden and ignored)",
  })
end, { desc = "Grep including hidden and ignored" })
vim.keymap.set("n", "<leader>fa", function()
  require("telescope.builtin").find_files({
    hidden = true,
    no_ignore = true,
  })
end, { desc = "Find files including hidden and ignored" })
vim.keymap.set("n", "<leader>fl", ":let @+=expand('%') .. ':' .. line('.')<cr>", {
  desc = "Copy current file name and line number to clipboard",
})
vim.keymap.set("n", "<leader>Y", function()
  vim.cmd("let @+ = expand('%')")
end, { desc = "Copy relative file path to clipboard" })

-- IDEs
-- Map Command + S to save the file
vim.keymap.set("n", "<D-s>", ":w<CR>", { noremap = true, desc = "Save File (Command + S)" })
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>a", { noremap = true, desc = "Save File (Command + S) in Insert Mode" })
