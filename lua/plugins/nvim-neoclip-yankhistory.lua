return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    {'kkharji/sqlite.lua', module = 'sqlite'},
    {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup()
  end,
}
