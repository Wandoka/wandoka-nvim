require("options.lazy")
-----------------------------------------------------------------------

------------------------LSP configuration------------------------------
-- All of lsp configuration files (for different languages) are inside .config/nvim/lsp/ 
-- We iterate through all of them, and add them to LSP
local lsp_configs = {}

for _, f in pairs(vim.api.nvim_get_runtime_file('lsp/*.lua', true)) do
  local server_name = vim.fn.fnamemodify(f, ':t:r')
  table.insert(lsp_configs, server_name)
end

vim.lsp.enable(lsp_configs)

-----------------------------------------------------------------------
------------------------Additional nevim configs-----------------------
require("options.general_nvim_options")

-----------------------------------------------------------------------
------------------------Hotkeys----------------------------------------
require("keybindings.fzf_keybindings")
require("keybindings.general_nvim_keybindings")
require("keybindings.competitest_cp_keybindings")
require("keybindings.debugger_keybindings")
require("keybindings.godot")
require("keybindings.tabs")
-----------------------------------------------------------------------
-----------------------------------------------------------------------
