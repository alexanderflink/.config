local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>j", "J", opts)
vim.keymap.set({ "n", "v" }, "J", "10j", opts)
vim.keymap.set({ "n", "v" }, "K", "10k", opts)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
vim.keymap.set(
	"n",
	"<leader>di",
	vim.diagnostic.open_float,
	{ noremap = true, silent = true, desc = "Show diagnostic" }
)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts)
vim.keymap.set("t", "<C-W>", "<C-\\><C-u><C-W>", opts)

vim.keymap.set({ "i", "n" }, "<C-t>n", "<Esc>:tabnew<CR>", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>x", "<Esc>:tabclose<CR>", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>h", "<Esc>:tabprevious<CR>", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>l", "<Esc>:tabnext<CR>", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>1", "<Esc>1gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>2", "<Esc>2gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>3", "<Esc>3gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>4", "<Esc>4gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>5", "<Esc>5gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>6", "<Esc>6gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>7", "<Esc>7gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>8", "<Esc>8gt", { remap = true, silent = true })
vim.keymap.set({ "i", "n" }, "<C-t>9", "<Esc>9gt", { remap = true, silent = true })
vim.keymap.set({ "n" }, "<leader>tt", ":ToggleTerm direction=float<CR>")
