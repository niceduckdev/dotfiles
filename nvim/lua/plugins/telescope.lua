return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local themes = require("telescope.themes")

		telescope.setup({
			pickers = {
				find_files = {
					theme = "dropdown",
				},
			},
		})

		vim.keymap.set("n", "<C-p>", function()
			builtin.find_files(themes.get_dropdown({ previewer = false }))
		end, {})
	end
}

