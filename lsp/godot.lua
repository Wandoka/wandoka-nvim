local pipe = "/tmp/godot.pipe"

return {
  name = {'Godot'},
  cmd = { 'godot-wsl-lsp', '--experimentalFastPathConversion' },
  filetypes = { 
    'gdscript',
    'gd'
  },
  root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, {
      upward = true,
      path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
  })[1]),
}
