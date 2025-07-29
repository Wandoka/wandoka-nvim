local mason_path = vim.fn.stdpath("data") .. "/mason/packages/cpptools/"
return {
 "mfussenegger/nvim-dap",
  config = function()
    local dap = require('dap')


    -- Настройка адаптера для gdb
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = mason_path .. "extension/debugAdapters/bin/OpenDebugAD7",
    }

    -- Конфигурация для языка cpp
    dap.configurations.cpp = {
      {
        name = "Debug executable",
        type = "cppdbg",
        request = "launch",
        program = function()
          local filepath = vim.api.nvim_buf_get_name(0) -- полный путь текущего буфера
          local executable = filepath:gsub("%.cpp$", "") -- убираем .cpp в конце
          return executable
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        symbols = { sourceFile = true },
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'Enable pretty printing',
            ignoreFailures = false
          },
        },
        args = function()
          local filepath = vim.api.nvim_buf_get_name(0)
          local dir = vim.fn.fnamemodify(filepath, ":h") -- директория файла
          return { dir .. "/debug_input.txt" }
        end,
      }
    }
  end
}
