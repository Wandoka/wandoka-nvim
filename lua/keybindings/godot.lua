local tt = require("toggleterm.terminal")

local function restart_default_term_and_exec(cmd)
  -- Находим дефолтный терминал (обычно id=1, если не создавали другие вручную)
  local default_term = tt.get(1)  -- или tt.get_focused() если хочешь текущий фокусированный, но лучше 1 для дефолтного

  if default_term then
    default_term:shutdown()  -- убивает процесс (lazygit и т.п.), закрывает буфер
    -- Можно добавить небольшую задержку, если иногда toggleterm глючит после shutdown
    -- vim.defer_fn(function() ... end, 50) — но обычно не нужно
  end

  -- Теперь запускаем в свежем дефолтном терминале
  vim.cmd("TermExec cmd='" .. cmd .. " 2>&1 | tr -cd \"[:print:]\\\\n\"'")
end


local function run_godot_scene()
  local root = vim.fn.getcwd()
  local win_path = root:gsub('/mnt/(%l)/', '%1:/')

  local current_file = vim.fn.expand('%:t')
  if current_file == '' then
    vim.notify('No file open or buffer has no name!', vim.log.levels.ERROR)
    return
  end

  local base = vim.fn.fnamemodify(current_file, ':r')
  base = base:gsub('_scene$', '')
  local target = base .. '_scene.gd'


  local find_cmd = string.format('find . -type f -name "%s" -print -quit', target)
  local results = vim.fn.systemlist(find_cmd)
  local selected = vim.fn.system(find_cmd):gsub('\n$', '')
  if selected == '' then
    vim.notify('No file selected or no matches found for ' .. target, vim.log.levels.WARN)
    return
  end 

  local tscn_path = 'res://' .. selected:gsub('^%./', ''):gsub('\\', '/')
  local godot_cmd = string.format('godot.windows.opt.tools.64.exe --path "%s" --scene "res://run_scene.tscn" -- %s', win_path, tscn_path)  
  
  vim.notify(godot_cmd)
  restart_default_term_and_exec(godot_cmd)

end

local function run_godot_game()
  local root = vim.fn.getcwd()
  local win_path = root:gsub('/mnt/(%l)/', '%1:/')
  local godot_cmd = string.format('godot.windows.opt.tools.64.exe --path "%s" --run', win_path)
  restart_default_term_and_exec(godot_cmd)
end

local function run_godot_test_run()
  local root = vim.fn.getcwd()
  local win_path = root:gsub('/mnt/(%l)/', '%1:/')
  local godot_cmd = string.format('godot.windows.opt.tools.64.exe --scene "res://test_run.tscn" --run', win_path)
  restart_default_term_and_exec(godot_cmd)
end

-- Create user command
vim.api.nvim_create_user_command('RunGodotScene', run_godot_scene, {})
vim.api.nvim_create_user_command('RunGodotGame', run_godot_game, {})
vim.api.nvim_create_user_command('RunGodotTestRun', run_godot_test_run, {})
-- Optional: Keymap (add to your mappings)
vim.keymap.set('n', '<leader>rs', ':RunGodotScene<CR>', { desc = 'Run Godot scene from current file' })
vim.keymap.set('n', '<leader>rg', ':RunGodotGame<CR>', { desc = 'Run Godot game of current project' })
vim.keymap.set('n', '<leader>rd', ':RunGodotTestRun<CR>', { desc = 'Run Godot test run on current project' })
