return {
	"github/copilot.vim",
	event = "InsertEnter",
	config = function()
		--  Remap accept to Ctrl+J instead of Tab
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
	end,
}
