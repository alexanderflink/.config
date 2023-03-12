return {
  -- install nightfox colorscheme
  { "EdenEast/nightfox.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "duskfox",
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "org",
        "python",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      autotag = {
        enable = true,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        astro = {},
        bashls = {},
        cssls = {},
        cssmodules_ls = {},
        eslint = {},
        graphql = {},
        html = {},
        jsonls = {},
        lua_ls = {},
        pyright = {},
        rust_analyzer = {},
        tsserver = {},
      },
    },
  },

  -- disable bufferline
  { "akinsho/bufferline.nvim", enabled = false },

  { "windwp/nvim-ts-autotag" },

  { "tpope/vim-abolish" },

  { "wakatime/vim-wakatime" },

  {
    "nvim-orgmode/orgmode",
    init = function()
      require("orgmode").setup_ts_grammar()
    end,

    lazy = false,
    opts = {

      org_agenda_files = { "/Users/alexanderflink/Library/Mobile Documents/com~apple~CloudDocs/Orgmode/*" },
      org_default_notes_file = "/Users/alexanderflink/Library/Mobile Documents/com~apple~CloudDocs/Orgmode/refile.org",
      mappings = {
        org = {
          org_toggle_checkbox = "<CR>",
        },
      },
    },
  },
}
