dofile(vim.fn.stdpath("config") .. "/plugins.lua")

-- ui config
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " }
vim.opt.showmode = false
vim.opt.shortmess:append("I")

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- settings
vim.opt.clipboard="unnamedplus"
vim.o.swapfile = false

vim.o.mouse = "a"
vim.bo.autoindent = false
vim.bo.smartindent = false

-- keymap
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>Pick files<CR>') 

-- reset cursor on exit
vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90"
})

-- colorscheme
vim.cmd.colorscheme "gruvbox"

vim.cmd([[
	highlight NormalFloat guibg=#282828 guifg=#ebdbb2
	highlight MiniPickPrompt guibg=#282828 guifg=#d79921
]])
