return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "tsx",
      "typescript",
      -- "jsx",
      "go",
      "gomod",
      "gowork",
      "gosum",
    })
  end,
}
