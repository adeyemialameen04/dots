return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("silicon").setup({
        font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
      })
    end,
    keys = {
      { "<leader>ts", "<cmd>Silicon<CR>", desc = "Take screenshot" },
      { "<leader>ts", ":Silicon<CR>", mode = "v", desc = "Take screenshot of selection" },
    },
  },
}
