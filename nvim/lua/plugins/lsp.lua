return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    {
      "hrsh7th/cmp-nvim-lsp",
      dependencies = {
        { "rafamadriz/friendly-snippets" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
      },
    },
    { "zbirenbaum/copilot.lua" },
    { "zbirenbaum/copilot-cmp" },

    -- Formatting and linting
    { "jose-elias-alvarez/null-ls.nvim", dependencies = { "jay-babu/mason-null-ls.nvim" } },
  },
  config = function()
    local lsp = require("lsp-zero").preset("recommended")

    lsp.on_attach(function(client, bufnr)
      lsp.buffer_autoformat()
    end)

    -- snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- copilot
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
    require("copilot_cmp").setup()

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    cmp.setup({
      preselect = "item",
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
      },
      mapping = {
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        ["<CR>"] = cmp.mapping.confirm({
          -- documentation says this is important.
          -- I don't know why.
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
      },
    })

    lsp.setup()

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Here you can add tools not supported by mason.nvim
      },
    })

    require("mason-null-ls").setup({
      ensure_installed = nil,
      automatic_installation = true,
      handlers = {},
    })
  end,
}
