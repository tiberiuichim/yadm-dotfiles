-- https://www.reddit.com/r/neovim/comments/1ihksco/what_can_i_put_in_my_lsp_config_to_hide_these/
-- vim.diagnostic.config({ virtual_text = false })
-- If you still want LSP suggestions on hover though, you can additionally use:
--
-- vim.api.nvim_create_autocmd("CursorHold", {
--     buffer = args.buf,
--     callback = function()
--         vim.diagnostic.open_float(nil, { focusable = false })
--     end
-- })
local function disable_text()
  -- vim.diagnostic.config({ virtual_text = false })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
  require("lspconfig")["pyright"].setup({
    capabilities = capabilities,
  })
  require("lspconfig")["basedpyright"].setup({
    capabilities = capabilities,
  })
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      pyright = {
        -- Set settings only if you want to override pyproject.toml,
        -- otherwise remove this block to allow file-based config
      },
      basedpyright = {
        -- Same advice as above
      },
      -- If using ruff_lsp, configure as needed
    },
  },
  keys = {
    -- vim.diagnostic.setloclist()
    { "<leader>uq", disable_text, desc = "Disable diagnostic text" },
    -- { "<leader>si", sort_imports, desc = "Sort imports with LSP" },
  },
}
