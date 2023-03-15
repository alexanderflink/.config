-- set leader key
vim.g.mapleader = " "
vim.g.localmapleader = " "
vim.wo.relativenumber = true
-- highlight on yank
vim.api.nvim_command("au TextYankPost * silent! lua vim.highlight.on_yank()")
vim.o.guifont = "Hack Nerd Font Mono:h13"
-- always show tabline
vim.o.showtabline = 2
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"

-- show a few extra lines around scroll position
vim.opt.scrolloff = 5

-- indendation
vim.opt.autoindent = false
vim.opt.smartindent = false

-- global key mappings
vim.keymap.set({ "i" }, "jk", "<Esc>")
vim.keymap.set({ "n", "v" }, "J", "10j")
vim.keymap.set({ "n", "v" }, "K", "10k")
vim.keymap.set({ "n", "v" }, "<leader>j", "J", { desc = "Join lines" })
