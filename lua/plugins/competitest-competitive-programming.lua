local compilation_flags = require('compilation_flags')
return {
  enabled = true,
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function() require('competitest').setup { 
	  compile_command = {
		  cpp = { exec = "clang++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)", unpack(compilation_flags.cpp_competitive_programming)}}
    },
    run_command = {
        cpp = {
            exec = "env",                     -- используем утилиту env
            args = {
                "UBSAN_OPTIONS=print_stacktrace=1:print_summary=0:halt_on_error=1:print_legend=0",
                "ASAN_OPTIONS=print_stacktrace=1:print_summary=0:print_legend=0:halt_on_error=1:verbosity=0:strip_path_prefix=/home/wandoka/personal/cp/workspace/main/",
                "ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer",
                "./$(FNOEXT)",
            },
        },
    },    
    runner_ui = {
		  interface = "popup",
      viewer = {
        width = 1.0,
        height = 1.0,
      }
    },
    popup_ui = {
      total_width = 1.0,
      total_height = 1.0,
      layout = {
        { 1, {
             { 1, "eo" },
             { 1, {
                  { 1, "tc" },
                  { 1, "si" },
                } },
           } },
        { 1, {
             { 1, "so" },
             { 1, "se" },
           } },
       }
	  },
	  testcases_use_single_file = true, 
    view_output_diff = false, 
  } 
  -- Подсветка "main.cpp" красным в окошке Errors (стандартная ошибка / stderr)
  -- Работает и в se-окне, и в viewer'е ошибок компиляции
  vim.api.nvim_create_augroup("CompetitestErrorHighlight", { clear = true })
  vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    group = "CompetitestErrorHighlight",
    callback = function()
      local title = vim.b.competitest_title
      if title and (title:find("Error") or title:find("stderr") or title:find("Errors")) then
        -- ErrorMsg — это стандартный красный цвет Neovim (можно поменять на свой)
        pcall(vim.fn.matchadd, "ErrorMsg", [[\<main\.cpp\>]], 10, -1, { window = 0 })
      end
    end,
  })
  end,
}
