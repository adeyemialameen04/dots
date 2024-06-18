-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set = vim.keymap.set

--using <tab> and <s-tab> for indenting and dedenting
set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
set("v", "<Tab>", ">gv", { noremap = true, silent = true })
set("n", "<S-Tab>", "<<_", { noremap = true, silent = true })
set("n", "<Tab>", ">>_", { noremap = true, silent = true })
-- Select all
set("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true, silent = true })
set("i", "<C-x>", "<Esc>dd<Insert>", { desc = "Delete line", noremap = true, silent = true })

-- make file executable
set("n", "<leader>cx", "<cmd>!chmod +x % >/dev/null 2>&1<cr>", { desc = "Make file executable", silent = true })
