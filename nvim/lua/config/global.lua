-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.wo.relativenumber = true
-- highlight on yank
vim.api.nvim_command("au TextYankPost * silent! lua vim.highlight.on_yank()")
vim.o.guifont = "Hack Nerd Font Mono:h13"
-- always show tabline
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"

-- show a few extra lines around scroll position
vim.opt.scrolloff = 5

-- indendation
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- global key mappings
vim.keymap.set({ "i" }, "jk", "<Esc>")
vim.keymap.set({ "v" }, "<", "<gv")
vim.keymap.set({ "v" }, ">", ">gv")
