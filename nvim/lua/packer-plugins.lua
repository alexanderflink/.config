return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("karb94/neoscroll.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("ishan9299/nvim-solarized-lua")
	use("nvim-lua/plenary.nvim")
	use("mhartington/formatter.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use({ "nvim-tree/nvim-tree.lua", commit = "8b8d457" })
	use("nvim-lualine/lualine.nvim")
	use("tpope/vim-surround")
	use("wellle/targets.vim")
	use("windwp/nvim-autopairs")
	use("tpope/vim-fugitive")
	use("windwp/nvim-ts-autotag")
	use("tpope/vim-commentary")
	use("lewis6991/gitsigns.nvim")
	use("folke/which-key.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("tpope/vim-sleuth")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nanozuki/tabby.nvim")
	use("EdenEast/nightfox.nvim")
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
	use("github/copilot.vim")
	use("tpope/vim-abolish")
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})
	use("wakatime/vim-wakatime")
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup()
		end,
	})
	use("nvim-orgmode/orgmode")
end)
