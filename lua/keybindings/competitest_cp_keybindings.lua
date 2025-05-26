vim.keymap.set(
  "n",
  "<leader>rt",
  ":CompetiTest run<CR>",
  { noremap = true, silent = true, desc = "<wandoka> Compile and run" }
)
vim.keymap.set(
  "n",
  "<leader>at",
  ":CompetiTest add_testcase<CR>",
  { noremap = true, silent = true, desc = "<wandoka> Add testcase" }
)
vim.keymap.set(
  "n",
  "<leader>dt",
  ":CompetiTest delete_testcase<CR>",
  { noremap = true, silent = true, desc = "<wandoka> Remove testcase" }
)
vim.keymap.set(
  "n",
  "<leader>et",
  ":CompetiTest edit_testcase<CR>",
  { noremap = true, silent = true, desc = "<wandoka> Edit testcase" }
)
vim.keymap.set(
  "n",
  "<leader>ut",
  ":CompetiTest show_ui<CR>",
  { noremap = true, silent = true, desc = "<wandoka> UI of testcases" }
)
vim.keymap.set(
  "n",
  "<leader>rb",
  function()
    vim.cmd("w")
    local flags = require('compilation_flags').cpp_competitive_programming
    local filename = vim.fn.expand("%:t")
    local filenoext = vim.fn.expand("%:t:r")
    local filedir = vim.fn.expand("%:p:h")
    local flags_str = table.concat(flags, " ")
    vim.cmd("TermExec cmd='cd " .. filedir .. " && clear'");
    vim.cmd("TermExec cmd='clear && g++ " .. flags_str .. " " .. filename .. " -o " .. filenoext .. " && ./" .. filenoext .. "'")
  end,
  { noremap = true, silent = true, desc = "<wandoka> run current cpp" }
)

