local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")
	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- OR use all default mappings
	api.config.mappings.default_on_attach(bufnr)

	local function single_click_edit()
		local node = api.tree.get_node_under_cursor()

		if node and node.type == "directory" then
			api.node.open.edit()
		end
	end

	local function live_grep_in_dir()
		local node = api.tree.get_node_under_cursor()
		local path = node.absolute_path

		if node.type ~= "directory" then
			path = vim.fn.fnamemodify(path, ":h")
		end

		require("telescope.builtin").live_grep({ search_dirs = { path } })
	end

	-- vim.keymap.set("n", "<LeftRelease>", single_click_edit, opts("Open or Toggle Directory"))
	vim.keymap.set("n", "<leader>sg", live_grep_in_dir, opts("[S]earch by [G]rep (in nvim-tree directory)"))
end

return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			view = {
				adaptive_size = true,
			},
			filters = { dotfiles = false },
			renderer = {
				highlight_opened_files = "all",
				high_light_modified = "all",
			},
		})
	end,
}
