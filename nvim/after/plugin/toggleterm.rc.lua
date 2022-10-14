local status, term = pcall(require, "toggleterm")
if (not status) then return end

term.setup({
  shade_terminals = false,
  direction = "float",
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<leader>t", [[<C-\><C-n><cmd>ToggleTerm<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = 1 })

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "single",
  },

  -- function to run on opening the terminal
  on_open = function(t)
    vim.cmd("stopinsert")
    vim.api.nvim_buf_set_keymap(t.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  -- function to run on closing the terminal
  ---@diagnostic disable-next-line: unused-local
  -- on_close = function(t)
  --   vim.cmd("startinsert!")
  -- end,
})

function Lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })
