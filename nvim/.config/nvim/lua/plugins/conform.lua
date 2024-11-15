return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {},
    formatters_by_ft = {
      ["javascriptreact"] = { { "biome" } },
      ["typescript"] = { { "biome" } },
      ["typescriptreact"] = { { "biome" } },
      -- ["css"] = { { "prettierd" } },
      -- ["html"] = { { "prettierd" } },
      -- ["json"] = { { "prettierd" } },
      -- ["jsonc"] = { { "prettierd" } },
      -- ["yaml"] = { { "prettierd" } },
      -- ["markdown"] = { { "prettierd" } },
      -- ["bash"] = { "shfmt" },
      -- ["sh"] = { "shfmt" },
      -- ["zsh"] = { "beautysh" },

      ["python"] = { "autopep8" },
      go = { "goimports", "gofumpt" },
    },
  },
}
