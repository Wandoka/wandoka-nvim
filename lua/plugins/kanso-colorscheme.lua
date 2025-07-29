return {
    "webhooked/kanso.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
    opts = {
      overrides = function(colors)
        colors.palette.inkGreen2 = "#9fcb9d"
        return {
          Identifier = { fg = colors.palette.inkYellow, italic = false },
          ["@variable"] = { fg = colors.palette.inkYellow, italic = false },
          ["@variable.member"] = { fg = colors.palette.inkYellow, italic = false },
          --["@variable.parameter"] = { fg = colors.palette.carpYellow, italic = false },
          ["@variable.parameter"] = { fg = colors.palette.inkYellow, italic = false },
          ["@keyword.return"] = { fg = colors.palette.inkAqua, italic = false },
          Keyword = { fg = colors.palette.inkAqua, italic = false },
          Type = { fg = colors.palette.inkViolet, italic = false },
          --Operator = { fg = colors.palette.inkRed, italic = true },
          Number = { fg = colors.palette.inkOrange2, italic = false },
          Comment = {italic = false},


          String = { fg = colors.palette.inkWhite, italic = false },

          Function = { fg = colors.palette.autumnGreen, italic = false },
          Operator = { fg = colors.palette.inkGreen2, italic = false },
          ["@constructor"] = { fg = colors.palette.autumnGreen, italic = false },

          Special = { fg = colors.palette.inkViolet, italic = false },
          -- other highlight groups...
        }
      end,
    },
    init = function()
      vim.cmd("colorscheme kanso-zen")
    end,
}

