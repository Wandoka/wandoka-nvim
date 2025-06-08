-----------------------------------------
-----------Fzf search types----------------
-- The idea here is that you have 3 possibilities where to search for files/text
-- a) Current project
-- b) From root directory 
-- c) From home directory
--
-- for current project  keybinds are <leader> + s + <button>
-- for root directory   keybinds are <leader> + s + r + <button>
-- for home directory   keybinds are <leader> + s + h + <button>



-- Buttons that are used here (g, h) should not be used for fzf searches, so don't use <leader> + s + r for register search for example
local search_actions = {
  {
    type = "Current project",
    path = "", -- Default path is current project, so there is no need to write anything here
    button = "",
  },
  {
    type = "Root directory",
    path = "cwd=/",
    button = "g",
  },
  {
    type = "Home directory",
    path = "cwd=~/",
    button = "h",
  }
}

for _, action in ipairs(search_actions) do
  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'f', function()
    vim.cmd("Fzf files " .. action.path)
end, { silent = true, desc = "<wandoka> Search files ("..action.type..")" })

  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'w', function()
    vim.cmd("Fzf grep_cword " .. action.path)
  end, { silent = true, desc = "<wandoka> Search current word ("..action.type..")" })

  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'W', function()
    vim.cmd("Fzf grep_cWORD " .. action.path)
  end, { silent = true, desc = "<wandoka> Search current WORD ("..action.type..")" })

  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'t', function()
    vim.cmd("Fzf live_grep " .. action.path)
  end, { silent = true, desc = "<wandoka> Search text ("..action.type..")" })
end

-- Listing all of the buffers
vim.keymap.set({'n', 'v'}, '<Leader>sb', function()
  vim.cmd("Fzf buffers")
end, { silent = true, desc = "<wandoka> Search buffers"})

-- List all colorschemes
vim.keymap.set({'n', 'v'}, '<Leader>sC', function()
  vim.cmd("Fzf awesome_colorschemes")
end, { silent = true, desc = "<wandoka> Search colorschemes"})

-- List keymaps
vim.keymap.set({'n', 'v'}, '<Leader>sK', function()
  vim.cmd("Fzf keymaps")
end, { silent = true, desc = "<wandoka> Search keybinds"})

-- List errors
vim.keymap.set({'n', 'v'}, '<Leader>se', function()
  vim.cmd("Fzf diagnostics_workspace")
end, { silent = true, desc = "<wandoka> Search errors"})

-- List marks
vim.keymap.set({'n', 'v'}, '<Leader>sm', function()
  vim.cmd("Fzf marks")
end, { silent = true, desc = "<wandoka> Search marks"})

vim.keymap.set({'n', 'v'}, '<Leader>sr', function()
  vim.cmd("lua require'fzf-lua'.resume()")
end, { silent = true, desc = "<wandoka> resume previouse search"})




-- Lists yank history (она чота не то делает)
--vim.keymap.set('n', '<Leader>sy', function()
--   require('neoclip.fzf')()
--end, { silent = true, desc = "Open neoclip with fzf" })
