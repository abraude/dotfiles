local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

local sources = {
  diagnostics.credo,
  diagnostics.codespell,
  formatting.mix,
  formatting.lua_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
