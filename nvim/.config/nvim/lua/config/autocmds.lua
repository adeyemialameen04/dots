-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
  autocmd FileType c setlocal tabstop=4
  autocmd FileType c setlocal shiftwidth=4
  autocmd FileType c setlocal noexpandtab
]])

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.tsx", "*.jsx", "*.js", "*.html" },
--   callback = function()
--     vim.cmd("silent !rustywind --write " .. vim.fn.expand("%"))
--   end,
-- })
