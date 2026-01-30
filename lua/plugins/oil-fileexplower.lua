return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = false,
    keymaps = {
      ["<C-s>"] = false, -- отключить вертикальный сплит на Ctrl+S
    },
    view_options = {
      is_hidden_file = function(name, bufnr)
        if not name then return false end
        -- начинается с точки (скрытый в unix)
        if name:match("^%.") then
          return true
        end
        -- оканчивается на ".uid" — обратите внимание: точки экранированы
        if name:match("%.uid$") then
          return true
        end
        return false
      end
    }
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
