-- Load custom treesitter grammar for org filetype
require("orgmode").setup_ts_grammar()

-- Treesitter configuration
require("nvim-treesitter.configs").setup({
	ensure_installed = { "org" }, -- Or run :TSUpdate org
})

require("orgmode").setup({
	org_agenda_files = { "/Users/alexanderflink/Library/Mobile Documents/com~apple~CloudDocs/Orgmode/*" },
	org_default_notes_file = "/Users/alexanderflink/Library/Mobile Documents/com~apple~CloudDocs/Orgmode/refile.org",
})
