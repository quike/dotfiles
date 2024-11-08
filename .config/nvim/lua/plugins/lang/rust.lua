return {
  -- overwrite Rust tools inlay hints

  {
    "simrat39/rust-tools.nvim",
    optional = true,
    -- opts = {
    --   dap = {
    --     local codelldb = mason_registry.get_package("codelldb"),
    --     local extension_path = codelldb:get_install_path() .. "/extension/",
    --     local codelldb_path = extension_path .. "adapter/codelldb",
    --     local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib",
    --     adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    --   },
    --   tools = {
    --     inlay_hints = {
    --       -- nvim >= 0.10 has native inlay hint support,
    --       -- so we don't need the rust-tools specific implementation any longer
    --       auto = not vim.fn.has('nvim-0.10')
    --     },
    --     -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    --     hover_actions = {
    --       auto_focus = true,
    --     },
    --   },
    --   server = {
    --     capabilities = require("cmp_nvim_lsp").default_capabilities(),
    --     on_attach = function(_, bufnr)
    --       -- Hover actions
    --       vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
    --       -- Code  action groups
    --       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    --     end,
    --   },
    -- },
    config = function()
      local rt = require("rust-tools")
      local mason_registry = require("mason-registry")
      local codelldb = mason_registry.get_package("codelldb")
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      rt.setup({
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
        tools = {
          inlay_hints = {
            -- nvim >= 0.10 has native inlay hint support,
            -- so we don't need the rust-tools specific implementation any longer
            auto = not vim.fn.has("nvim-0.10"),
          },
          -- options same as lsp hover / vim.lsp.util.open_floating_preview()
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code  action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
  },
}
