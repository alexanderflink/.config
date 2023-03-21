return {
  -- nightfox theme
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme duskfox")
    end,
  },

  -- syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "css",
          "dockerfile",
          "fish",
          "git_rebase",
          "gitattributes",
          "gitignore",
          "glsl",
          "go",
          "graphql",
          "html",
          "http",
          "javascript",
          "json",
          "lua",
          "php",
          "python",
          "rust",
          "scss",
          "sql",
          "tsx",
          "typescript",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        indent = {
          enable = false,
        },
        context_commentstring = {
          enable = true,
        },
      })
    end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>e", ":NvimTreeFindFileToggle<CR>", desc = "File explorer" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        view = {
          adaptive_size = true,
        },
        actions = {
          open_file = {
            quit_on_open = true,
            window_picker = {
              enable = false,
            },
          },
        },
      })
    end,
  },

  -- nicer tabline
  {
    "nanozuki/tabby.nvim",
    config = function()
      local theme = {
        fill = "TabLineFill",
        -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
        head = "TabLine",
        current_tab = "TabLineSel",
        tab = "TabLine",
        win = "TabLine",
        tail = "TabLine",
      }

      require("tabby.tabline").set(function(line)
        return {
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("", hl, theme.fill),
              tab.is_current() and "" or "",
              tab.number(),
              tab.name(),
              line.sep("", hl, theme.fill),
              hl = hl,
              margin = " ",
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            local hl = win.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("", hl, theme.fill),
              win.is_current() and "" or "",
              win.buf_name(),
              line.sep("", hl, theme.fill),
              hl = hl,
              margin = " ",
            }
          end),
          hl = theme.fill,
        }
      end)
    end,
  },

  -- commenting with "gcc"
  {
    "echasnovski/mini.comment",
    config = function()
      require("mini.comment").setup()
    end,
  },

  -- animate scroll
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = true,
  },

  -- nicer statusline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          globalstatus = true,
        },
        sections = {
          lualine_c = {
            {
              "filename",
              file_status = true,
              path = 3,
            },
          },
        },
      })
    end,
  },

  -- surround things
  { "kylechui/nvim-surround",  lazy = false, config = true },

  -- add more text objects, like functions and arguments
  {
    "echasnovski/mini.ai",
    config = function()
      require("mini.ai").setup()
    end,
  },

  -- automatically complete pairs of parenthesis
  {
    "echasnovski/mini.pairs",
    config = function()
      require("mini.pairs").setup()
    end,
  },

  -- Fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = true,
  },

  -- Show key mappings
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.register({
        c = {
          name = "Code",
        },
        f = {
          name = "Find",
          f = { "<cmd>Telescope find_files<CR>", "Find files" },
          b = { "<cmd>Telescope buffers<CR>", "Find Buffers" },
          r = { "<cmd>Telescope lsp_references<CR>", "Find references" },
        },
        s = { ":Telescope live_grep<CR>", "Search" },
      }, { prefix = "<leader>" })
    end,
  },

  -- git integration
  {
    "tpope/vim-fugitive",
    cmd = "G",
  },

  -- auto detect indent levels
  {
    "tpope/vim-sleuth",
    lazy = false,
  },

  -- formatting
  -- {
  --   "mhartington/formatter.nvim",
  --   lazy = false,
  --   config = function()
  --     require("formatter").setup({
  --       filetype = {
  --         lua = {
  --           require("formatter.filetypes.lua").stylua,
  --         },
  --         typescriptreact = {
  --           require("formatter.filetypes.typescriptreact").prettier,
  --         },
  --         typescript = {
  --           require("formatter.filetypes.typescriptreact").prettier,
  --         },
  --         javascript = {
  --           require("formatter.filetypes.javascript").prettier,
  --         },
  --         html = {
  --           require("formatter.filetypes.html").prettier,
  --         },
  --         javascriptreact = {
  --           require("formatter.filetypes.javascriptreact").prettier,
  --         },
  --         rust = function()
  --           return {
  --             exe = "rustfmt --edition 2021",
  --             stdin = true,
  --           }
  --         end,
  --         -- requires https://github.com/withastro/prettier-plugin-astro to be installed globally
  --         astro = function()
  --           return {
  --             exe = "prettier --parser astro",
  --             args = { util.escape_path(util.get_current_buffer_file_path()) },
  --             stdin = true,
  --             -- not yet implemented https://github.com/mhartington/formatter.nvim#try_node_modules
  --             try_node_modules = true,
  --           }
  --         end,
  --       },
  --     })
  --
  --     vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = "FormatWrite" })
  --   end,
  -- },

  -- git gutters
  { "lewis6991/gitsigns.nvim", config = true },
}
