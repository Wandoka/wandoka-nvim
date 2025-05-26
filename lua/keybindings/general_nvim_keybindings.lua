-- When we select text, we can use >> or << several times
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = "<wandoka> move several times with >"})
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = "<wandoka> move several times with <"})

-- Open Oil file explorer
vim.keymap.set('n', '<leader>o', ':Oil<CR>', {
  noremap = true, 
  silent = true, 
  desc = "<wandoka> Open Oil file explorer"
})

-- Search, new and delete session
vim.keymap.set('n', '<leader>ss', function() require("nvim-possession").list() end, 
  { desc = "<wandoka> list sessions" })
vim.keymap.set('n', '<leader>ns', function() require("nvim-possession").new() end, 
  { desc = "<wandoka> create new session" })
vim.keymap.set('n', '<leader>ds', function() require("nvim-possession").delete() end, 
  { desc = "<wandoka> delete selected session" })

-- Exiting terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Opening a terminal
vim.keymap.set({'n', 't'}, '<C-\\>', '<Cmd>ToggleTerm<CR>', {
  noremap = true, 
  silent = true, 
  desc = "<wandoka> Open a terminal"
})
