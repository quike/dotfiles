return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  config = function()
    vim.keymap.set("n", "<leader>t1", ":TestNearest<CR>", { desc = "vim-test: Test Nearest" })
    vim.keymap.set("n", "<leader>t2", ":TestFile<CR>", { desc = "vim-test: Test File" })
    vim.keymap.set("n", "<leader>t3", ":TestSuite<CR>", { desc = "vim-test: Test Suite" })
    vim.keymap.set("n", "<leader>t4", ":TestLast<CR>", { desc = "vim-test: Test Last" })
    vim.keymap.set("n", "<leader>t5", ":TestVisit<CR>", { desc = "vim-test: Test Visit" })
    vim.cmd("let test#strategy = 'basic'")
  end,
}
