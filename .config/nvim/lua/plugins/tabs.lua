return {
	"romgrk/barbar.nvim",
	config = function()
		vim.g.barbar_auto_setup = false
		require'barbar'.setup {
			animation = false,
			icons = {
				button = '',
				filetype = {
					enabled = false,
				}
			},
		}
	end
}
