return {
  "webhooked/kanso.nvim",
  lazy = false,
  enabled = true,
  priority = 1000,
  opts = {
    overrides = function(colors)
      -- Пример переопределения одного из цветов в палитре:
      colors.palette.green2 = "#9fcb9d"  -- раньше inkGreen2

      return {
        Identifier           = { fg = colors.palette.yellow3,   italic = false }, -- inkYellow → yellow3 (#c4b28a)
        ["@variable"]        = { fg = colors.palette.yellow3,   italic = false },
        ["@variable.member"] = { fg = colors.palette.yellow3,   italic = false },
        ["@variable.parameter"] = { fg = colors.palette.yellow3, italic = false },
        ["@keyword.return"]  = { fg = colors.palette.aqua,      italic = false }, -- inkAqua → aqua
        Keyword              = { fg = colors.palette.aqua,      italic = false },
        Type                 = { fg = colors.palette.violet2,   italic = false }, -- inkViolet → violet2
        Number               = { fg = colors.palette.orange2,   italic = false }, -- inkOrange2 → orange2
        Comment              = { italic = false },

        String               = { fg = colors.palette.fg,        italic = false }, -- inkWhite → fg

        Function             = { fg = colors.palette.gitGreen, italic = false }, -- autumnGreen → gitGreen
        Operator             = { fg = colors.palette.green2,   italic = false }, -- inkGreen2 → green2
        ["@constructor"]     = { fg = colors.palette.gitGreen, italic = false },

        Special              = { fg = colors.palette.violet2,   italic = false },
        -- другие группы...
      }
    end,
  },
  init = function()
    vim.cmd("colorscheme kanso-zen")
  end,
}

