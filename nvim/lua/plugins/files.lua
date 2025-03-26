return {
    "nvim-tree/nvim-tree.lua",
    config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { silent = true })
		require'nvim-tree'.setup {
			renderer = {
    			icons = {
      				show = {
        				file = false,
        				folder = false,
        				folder_arrow = false,
        				git = false
      				}
    			}
  			}
		}
    end
}
