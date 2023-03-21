return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- LSP Support
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional
      { "zbirenbaum/copilot.lua" },
      { "zbirenbaum/copilot-cmp" },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    },
    config = function()
      require('mason').setup()

      require('mason-lspconfig').setup({
        ensure_installed = {
          -- Replace these with whatever servers you want to install
          "astro",
          "bashls",
          "cssls",
          "cssmodules_ls",
          "eslint",
          "graphql",
          "html",
          "jsonls",
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "tsserver",
        }
      })

      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_attach = function(_, bufnr)
        -- format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format { async = false }
          end
        })

        -- set LSP keymaps
        vim.keymap.set("n", "gd", vim.lsp.buf.definition,
          { buffer = bufnr, remap = false, desc = "Go to definition" })
        vim.keymap.set("n", "H", vim.lsp.buf.hover,
          { buffer = bufnr, remap = false, desc = "Hover" })
        vim.keymap.set(
          "n",
          "<leader>cd",
          vim.diagnostic.open_float,
          { buffer = bufnr, remap = false, desc = "Show diagnostic" }
        )
        vim.keymap.set(
          "n",
          "<leader>ca",
          vim.lsp.buf.code_action,
          { buffer = bufnr, remap = false, desc = "Code actions" }
        )
        vim.keymap.set(
          "n",
          "<leader>cr",
          vim.lsp.buf.references,
          { buffer = bufnr, remap = false, desc = "References" }
        )
        vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename,
          { buffer = bufnr, remap = false, desc = "Rename" })
      end

      local lspconfig = require('lspconfig')
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local settings = {}
          if (server_name == 'lua_ls') then
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' }
                }
              }
            }
          end

          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            settings = settings
          })
        end
      })

      local luasnip = require 'luasnip'

      -- Copilot
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })

      require("copilot_cmp").setup()

      -- nvim-cmp setup
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
          ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
          -- C-b (back) C-f (forward) for snippet placeholder navigation.
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'copilot' }
        },
      }
    end
  },
}
