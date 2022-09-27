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

local on_attach = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
  end

  vim.cmd [[
    augroup document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]
end


null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
