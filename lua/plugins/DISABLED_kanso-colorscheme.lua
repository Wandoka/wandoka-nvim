return {
  "webhooked/kanso.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,   
  config = function()
    vim.cmd([[colorscheme kanso-zen]])
  end,
}
