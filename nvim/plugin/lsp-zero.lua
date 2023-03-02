local lsp = require("lsp-zero")
local cmp = require("cmp")

lsp.preset("recommended")

lsp.ensure_installed({
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
})

lsp.set_preferences({
	set_lsp_keymaps = false,
})

local cmp_mappings = lsp.defaults.cmp_mappings()

-- Disable completion with tab this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>de", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()
