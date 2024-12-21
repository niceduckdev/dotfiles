vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.fillchars = { eob = " " }
vim.o.mouse = "a"

vim.bo.autoindent = false
vim.bo.smartindent = false

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.opt.clipboard="unnamedplus"

vim.opt.shortmess:append("I")
