local util = require("formatter.util")

require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		rust = function()
			return {
				exe = "rustfmt --edition 2021",
				stdin = true,
			}
		end,
		-- requires https://github.com/withastro/prettier-plugin-astro to be installed globally
		astro = function()
			return {
				exe = "prettier --parser astro",
				args = { util.escape_path(util.get_current_buffer_file_path()) },
				stdin = true,
				-- not yet implemented https://github.com/mhartington/formatter.nvim#try_node_modules
				try_node_modules = true,
			}
		end,
	},
})
