return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("bufferline").setup({
			options = {
				diagnostic = "nvim_lsp",
			},
		})
	end,
}
