-- функция: перейти на таб number, создавая недостающие табы
local function go_to_tab(n)
  local cur = vim.fn.tabpagenr('$')       -- текущее количество табов
  if n > cur then
    for _ = cur + 1, n do
      vim.cmd('tabnew')                    -- создаём пустой таб
    end
  end
  vim.cmd('tabnext ' .. n)                 -- переходим на таб n
end

-- маппинги для <leader>1..5 (можно увеличить до 9 или любого числа)
for i = 1, 5 do
  vim.keymap.set('n', '<leader>' .. i, function() go_to_tab(i) end,
    { desc = string.format("Go to tab %d (create if missing)", i) })
end

