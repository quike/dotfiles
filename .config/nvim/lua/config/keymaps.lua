-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local dap = require("dap")

vim.keymap.set("n", "<F1>", dap.continue, { desc = "dap continue" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "dap step into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "dap step over" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "dap step out" })
vim.keymap.set("n", "<F5>", dap.step_back, { desc = "dap step back" })
vim.keymap.set("n", "<F6>", dap.restart, { desc = "dap restart" })
vim.keymap.set("n", "<F7>", dap.stop, { desc = "dap stop" })
