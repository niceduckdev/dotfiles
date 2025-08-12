require "paq" {
    "savq/paq-nvim",
    "neovim/nvim-lspconfig",
    { "morhetz/gruvbox" },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'echasnovski/mini.pick' },
}

require("mini.pick").setup({
	mappings = {
	    caret_left  = '<M-h>',
    	caret_right = '<M-l>',
    	move_up = '<M-k>',
    	move_down = '<M-j>',
	}
})
