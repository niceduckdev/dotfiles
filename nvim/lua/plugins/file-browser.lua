return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope.builtin")
		vim.keymap.set("n", "<C-b>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
	end
}
