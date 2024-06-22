return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      -- sql formatter doesnt seem to work unless i do this
      ["sql-formatter"] = {
        command = "/home/muizzyranking/.local/share/nvim/mason/bin/sql-formatter",
      },
      -- use semi standard prettier formatter to format javascript
      -- ["semi-prettier"] = {
      --   command = "/home/muizzyranking/.npm-global/bin/prettier-semistandard",
      -- },
    },
    formatters_by_ft = {
      -- use semi standard prettier formatter to format javascript
      -- ["javascript"] = { "semi-prettier" },

      ["javascriptreact"] = { { "prettierd" } },
      ["typescript"] = { { "prettierd" } },
      ["typescriptreact"] = { { "prettierd" } },
      ["css"] = { { "prettierd" } },
      ["html"] = { { "prettierd" } },
      ["json"] = { { "prettierd" } },
      ["jsonc"] = { { "prettierd" } },
      ["yaml"] = { { "prettierd" } },
      ["markdown"] = { { "prettierd" } },

      -- ["bash"] = { "shfmt" },
      -- ["sh"] = { "shfmt" },
      -- ["zsh"] = { "beautysh" },
      --
      -- ["sql"] = { "sql-formatter" },

      ["python"] = { "autopep8" },
    },
  },
}
