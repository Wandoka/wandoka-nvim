debug_mode_is_on = false
vim.keymap.set(
  {"n", "v"},
  "<leader>db",
  function()
    local debugmaster = require("debugmaster")
    if(debug_mode_is_on == false) then
      vim.notify("Debug mode enabled", vim.log.levels.INFO)
      require("dap").continue()
      debugmaster.mode.toggle()
      debug_mode_is_on = true
    else 
      vim.notify("Debug mode disabled", vim.log.levels.INFO)
      require("dap").terminate()
      local state = require("debugmaster.state")
      state.sidepanel:close()
      debugmaster.mode.toggle()
      debug_mode_is_on = false
    end
  end, 
  { noremap = true, silent = true, desc = "<wandoka> debug current buffer" }
)

