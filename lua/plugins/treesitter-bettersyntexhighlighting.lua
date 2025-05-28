-- Пример использования: удалить всё содержимое функции с помощью dif
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- автоматически обновляет парсеры
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "python", "javascript", "html", "css", "json", "cpp" -- сюда добавляй нужные языки
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        indent = {
          enable = true
        }
      }
    end,
  }
}
