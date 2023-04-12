return {
  -- nord theme
  { "shaunsingh/nord.nvim" },
  -- git integration
  { "tpope/vim-fugitive",       cmd = "G" },

  -- coding stats
  { "wakatime/vim-wakatime",    lazy = false },

  -- todo comments
  { "folke/todo-comments.nvim", config = true },

  -- animate scroll
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = true,
  },

  -- surround things
  { "kylechui/nvim-surround",   lazy = false,  config = true },

  -- add more text objects, like functions and arguments
  {
    "echasnovski/mini.ai",
    lazy = false,
    config = function() require("mini.ai").setup() end,
  },

  -- jump around with "s"
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function() require("leap").add_default_mappings() end,
  },

  -- better "f" and "t"
  {
    "ggandor/flit.nvim",
    config = true,
    lazy = false,
    dependencies = {
      "tpope/vim-repeat",
    },
  },

  -- smarter substitute, among other things
  { "tpope/vim-abolish",        lazy = false },

  -- todo comments
  { "folke/todo-comments.nvim", config = true, lazy = false },
}
