-- [[ LSP Settings ]]

-- Hides the inline LSP warning and error messages (use TroubleToggle instead)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)
