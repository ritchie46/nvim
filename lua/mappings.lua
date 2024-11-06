-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Comment out code with CTRL+/
vim.keymap.set("n", "<C-_>", "gcc", { remap = true })
vim.keymap.set("v", "<C-_>", "gc", { remap = true })

-- Dedent code with SHIFT+TAB
vim.keymap.set("i", "<S-Tab>", "<C-d>", { remap = true })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { remap = true })

-- Tab + Shift-tab indent/dedent in visual blocks and keep selection
vim.keymap.set("x", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.keymap.set("x", "<Tab>", ">gv", { noremap = true, silent = true })

-- NvimTree
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile!<CR>", { silent = true, desc = "Open at this file" })
vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { silent = true, desc = "[C]ollapse all" })
-- Diagnostic keymaps

-- SET LOCAL LIST
-- vim.keymap.set("n", "<leader>l", vim.diagnostic.setloclist, { desc = "Open diagnostic [L]ocal list" })

-- TOGGLE QUICKFIX
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })
function OpenQuickfix(severity)
	local severities = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN }
	for _, sev in ipairs(severities) do
		local diagnostics = vim.diagnostic.get(nil, { severity = sev })
		if #diagnostics > 0 then
			vim.diagnostic.setqflist({ open = true, severity = sev })
			return
		end
	end
end

function OpenLocal()
	-- Ensure qfl is closed
	vim.cmd("cclose")
	-- Populate the qfl with diagnostics
	vim.diagnostic.setloclist()
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>q",
	":lua OpenQuickfix()<CR>",
	{ noremap = true, silent = true, desc = "Open diagnostic [Q]uickfix list" }
)
vim.keymap.set("n", "<leader>Q", ":cclose<CR>", { noremap = true, silent = true, desc = "Close quickfix list" })

vim.api.nvim_set_keymap(
	"n",
	"<leader>l",
	":lua OpenLocal()<CR>",
	{ noremap = true, silent = true, desc = "Open diagnostic [L]ocal list" }
)
vim.keymap.set("n", "<leader>Q", ":cclose<CR>", { noremap = true, silent = true, desc = "Close quickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
