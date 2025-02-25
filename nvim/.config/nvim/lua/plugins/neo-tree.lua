return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>E",
      "<cmd>Neotree toggle float<cr>",
      desc = "Float File Explorer",
    },
    {
      "<leader>e",
      "<cmd>Neotree toggle right<cr>",
      desc = "Right File Explorer",
    },
  },
  config = function()
    local git_available = vim.fn.executable("git") == 1
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "single",
      enable_git_status = git_available,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = " ",
          highlight = "NeoTreeModified",
        },
        git_status = {
          symbols = {
            -- Change type
            added = " ",
            deleted = " ",
            modified = " ",
            renamed = " ",
            -- Status type
            untracked = " ",
            ignored = " ",
            unstaged = " ",
            staged = " ",
            conflict = " ",
          },
        },
      },
      -- Set the default window position to "right"
      window = {
        position = "right",
        width = 40,
        mappings = {
          ["h"] = "prev_source",
          ["l"] = "next_source",
          ["D"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.system("trash " .. vim.fn.fnameescape(path))
          end,
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        filtered_items = {
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            "node_modules",
            ".git",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      event_handlers = {
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
      },
    })
  end,
}
