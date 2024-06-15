local comment_key = "<leader>/"

return {
  "echasnovski/mini.comment",
  opts = {
    options = {
      custom_commentstring = function()
        local filetype = vim.bo.filetype

        if filetype == "c" then
          return "/*%s*/"
        end
      end,
    },
    mappings = {
      comment_line = comment_key,

      comment_visual = comment_key,
    },
  },
}
