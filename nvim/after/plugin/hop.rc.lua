local status, hop = pcall(require, "hop")
if (not status) then return end


hop.setup()

vim.api.nvim_set_keymap('', '<leader>f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>"
  , {})
