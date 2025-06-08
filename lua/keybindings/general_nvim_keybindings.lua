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
--vim.keymap.set({'n', 't'}, '<C-\\>', '<Cmd>ToggleTerm<CR>', {
--  noremap = true, 
--  silent = true, 
--  desc = "<wandoka> Open a terminal"
--})
-- Opening a terminal  (with ability to put a number before, to open a specific terminal)
vim.keymap.set({'n', 't'}, '<C-\\>', function()
  local count = vim.v.count1
  if count ~= 0 then
    vim.cmd(count .. "ToggleTerm")
  else
    vim.cmd("ToggleTerm")
  end
end, {
  noremap = true,
  silent = true,
  desc = "Toggle terminal (or specific one with number prefix)"
})

-- Lists code actions available for the current line
vim.keymap.set({'n', 'v'}, '<Leader>ca', function()
    vim.lsp.buf.code_action()
end, { silent = true, desc = "<wandoka> LSP Code Actions" })

-- Go up down when wrap enabled
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "<wandoka> Down (smart with wrap)", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "<wandoka> Up (smart with wrap)", expr = true, silent = true })


-- Move lines with alt
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "<wandoka> Move text Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "<wandoka> Move text Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "<wandoka> Move text Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "<wandoka> Move text Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "<wandoka> Move text Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "<wandoka> Move text Up" })


-- Lazygit
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "<wandoka> Lazygit" })


-- Diagnostic navigation
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "<wandok> Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "<wandoka> Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "<wandoka> Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "<wandoka> Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "<wandoka> Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "<wandoka> Prev Warning" })


-- Save file with Crtl-s
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "<wandoka> Save File" })

vim.keymap.set("i", "<C-p>", "<C-r>\"", { desc = "Paste from default register" })

