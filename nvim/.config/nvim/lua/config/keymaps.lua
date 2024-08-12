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

-- Save and close all buffers
-- set("n", "<leader>ba", ":wa | %bd<CR>", { desc = "Save and close all buffers", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ba", function()
  -- Save all buffers
  vim.cmd("wa")

  -- Get all buffer numbers
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    -- Check if the buffer is valid and not the NeoTree buffer
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype ~= "neo-tree" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = "Save and close all buffers except NeoTree", noremap = true, silent = true })

-- make file executable
set("n", "<leader>cx", "<cmd>!chmod +x % >/dev/null 2>&1<cr>", { desc = "Make file executable", silent = true })
