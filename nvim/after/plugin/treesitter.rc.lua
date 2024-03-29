local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "elixir",
    "eex",
    "heex",
    "erlang",
    "python",
    "v",
    "sql",
    "ledger",
    "rust",
    "mermaid",
  },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "eex",
      "heex",
      "xml",
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'svelte',
      'vue',
      'tsx',
      'jsx',
      'markdown',
      'glimmer',
      'handlebars',
      'hbs',
      'rs',
      'mermaid',
      'mmd',
      "journal",
    },
  },
  rainbow = {
    enable = true,
  },
}

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
