local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

vim.keymap.set('n', 'x', '"_x')

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymap("n", "<C-w><Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<C-w><Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<C-w><Up>", ":resize -1<CR>", default_opts)
keymap("n", "<C-w><Down>", ":resize +1<CR>", default_opts)

