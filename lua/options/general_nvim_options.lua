-- Add numbers to lines
vim.wo.number = true

-- Fixed border on the left nearby the number lines (so text does not shift to the right every time a breakpoint/error appears)
vim.opt.signcolumn = "yes:1"

-- X spaces tab
vim.opt.tabstop = 2       
vim.opt.shiftwidth = 2  -- Move X units when using << or >> 
vim.opt.softtabstop = 2   
vim.opt.expandtab = true


vim.diagnostic.config({
  virtual_text = true,  --enables LSP diagnosic lines
  update_in_insert = true, -- enables LSP diagnosic lines in the insert mode
})


-- Enables copy and pasting from windows to WSL nvim and vise versa
vim.opt.clipboard:append("unnamedplus")
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = true,
}
end


-- Disables LSP text highlighting by setting it's priority lower that treesitter's
vim.highlight.priorities.semantic_tokens = 90
vim.highlight.priorities.treesitter = 100

-- status LINE with doing plugin, TODO, now it is shit WARN 
--vim.opt.statusline = "%f %h%m%r %=%{v:lua.require'doing'.status()}"
