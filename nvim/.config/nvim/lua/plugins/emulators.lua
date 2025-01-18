return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "dimaportenko/telescope-simulators.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        simulators = {
          android_emulator = true,
          apple_simulator = false,
        },
      },
    })

    -- simulators bind
    vim.keymap.set("n", "<leader>fs", function()
      vim.cmd(":Telescope simulators run")
    end)
  end,
}
