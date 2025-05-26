return {
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup{
        direction = 'float',       -- Всплывающее окно (pop-up)
        close_on_exit = true,      -- Закрывать терминал при завершении процесса
      }
    end,
  }
}
