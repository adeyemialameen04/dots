return {
  {
    "williamboman/mason.nvim",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        "shellcheck",
        "css-lsp",
        "eslint-lsp",
        "prettierd",
        "typescript-language-server",
        "ast-grep",
        "tailwindcss-language-server",
        "clangd",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
}
