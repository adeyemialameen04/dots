return {
  {
    "williamboman/mason.nvim",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        "shellcheck",
        "css-lsp",
        -- "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "clangd",
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
}
