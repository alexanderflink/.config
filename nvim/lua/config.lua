vim.wo.relativenumber = true
-- highlight on yank
vim.api.nvim_command("au TextYankPost * silent! lua vim.highlight.on_yank()")
vim.o.guifont = "Hack Nerd Font Mono:h13"
-- enter terminal mode when opening a terminal
-- vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, { pattern = { "term://*" }, command = "startinsert" })
-- always show tabline
vim.o.showtabline = 2
vim.cmd("colorscheme duskfox")
-- auto format on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, { command = "FormatWrite" })
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
