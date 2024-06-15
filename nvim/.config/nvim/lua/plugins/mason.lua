return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = {
      ensure_installed = {
        "shellcheck",
        "css-lsp",
        "eslint-lsp",
        "prettierd",
        "typescript-language-server",
        "tailwindcss-language-server",
        "clangd",
      },
    },
  },
}
