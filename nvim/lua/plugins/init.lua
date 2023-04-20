return {
  -- nightfox theme
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme nordfox")
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

  -- jump around with "s"
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  -- better "f" and "t"
  {
    "ggandor/flit.nvim",
    config = true,
    dependencies = {
      "tpope/vim-repeat",
    },
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
  { "kylechui/nvim-surround", lazy = false, config = true },

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
        f = {
          name = "Find",
          f = { "<cmd>Telescope find_files<CR>", "Find files" },
          b = { "<cmd>Telescope buffers<CR>", "Find Buffers" },
          r = { "<cmd>Telescope lsp_references<CR>", "Find references" },
          s = { ":Telescope live_grep<CR>", "Find word" },
        },
      }, { prefix = "<leader>" })
    end,
  },

  -- git integration
  {
    "tpope/vim-fugitive",
    cmd = "G",
  },

  -- auto detect indent levels
  { "nmac427/guess-indent.nvim", config = true },

  -- git gutters
  { "lewis6991/gitsigns.nvim", config = true },

  -- smarter substitue, among other things
  { "tpope/vim-abolish" },

  -- todo comments
  { "folke/todo-comments.nvim", config = true },

  -- list of diagnostics etc
  { "folke/trouble.nvim", config = true },

  -- coding stats
  { "wakatime/vim-wakatime" },
}
