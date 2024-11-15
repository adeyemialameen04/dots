-- ~/.config/nvim/lua/plugins/snippets.lua
return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()

    local luasnip = require("luasnip")
    local s = luasnip.snippet
    local t = luasnip.text_node

    luasnip.add_snippets("all", {
      s("hi", {
        t("hello, world"),
      }),
    })

    -- If you want to load from a file:
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/luasnippets/",
    })
  end,
}
