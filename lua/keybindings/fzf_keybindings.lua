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
  local base_opts = {}
  if action.path ~= "" then
    base_opts.cwd = action.path:gsub("cwd=", "")  -- преобразуем cwd=~/ в ~/
  end

  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'f', function()
    require("fzf-lua").files(vim.tbl_extend("force", base_opts, {
      file_ignore_patterns = { "%.uid$" },
      -- можно добавить другие паттерны, если нужно: "%.bak$", "%.tmp$" и т.д.
    }))
  end, { silent = true, desc = "<wandoka> Search files ("..action.type..")" })

  -- аналогично для остальных
  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'w', function()
    require("fzf-lua").grep_cword(vim.tbl_extend("force", base_opts, {
      file_ignore_patterns = { "%.uid$" }
    }))
  end, { silent = true, desc = "<wandoka> Search current word ("..action.type..")" })

  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'W', function()
    require("fzf-lua").grep_cWORD(vim.tbl_extend("force", base_opts, {
      file_ignore_patterns = { "%.uid$" }
    }))
  end, { silent = true, desc = "<wandoka> Search current WORD ("..action.type..")" })

  vim.keymap.set({'n', 'v'}, '<Leader>s'..action.button..'t', function()
    require("fzf-lua").live_grep(vim.tbl_extend("force", base_opts, {
      file_ignore_patterns = { "%.uid$" }
    }))
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
