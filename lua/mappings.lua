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

-- Diagnostic
vim.keymap.set("n", "]q", ":cnext<CR>", { silent = true, desc = "Jump to next item in Quickfix list" })
vim.keymap.set("n", "[q", ":cprevious<CR>", { silent = true, desc = "Jump to previous item in Quickfix list" })

vim.keymap.set("n", "]l", ":lnext<CR>", { silent = true, desc = "Jump to next item in Local list" })
vim.keymap.set("n", "[l", ":lprevious<CR>", { silent = true, desc = "Jump to previous item in Local list" })

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
function OpenQuickfix(severities)
	vim.cmd("cclose")
	local severities = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN }
	for _, sev in ipairs(severities) do
		local diagnostics = vim.diagnostic.get(nil, { severity = sev })
		if #diagnostics > 0 then
			vim.diagnostic.setqflist({ open = true, severity = sev })
			return
		end
	end
end

function OpenQuickfixDefault()
	local s = vim.diagnostic.severity
	OpenQuickfix({ s.ERROR, s.WARN })
end

function OpenQuickfixVerbose()
	local s = vim.diagnostic.severity
	OpenQuickfix({ s.ERROR, s.WARN, s.INFO, s.HINT })
end

function OpenLocal()
	vim.cmd("lclose")
	-- Populate the qfl with diagnostics
	vim.diagnostic.setloclist()
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>q",
	":lua OpenQuickfixDefault()<CR>",
	{ noremap = true, silent = true, desc = "Open diagnostic [Q]uickfix list" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>Q",
	":lua OpenQuickfixVerbose()<CR>",
	{ noremap = true, silent = true, desc = "Open diagnostic [Q]uickfix list (verbose)" }
)

vim.api.nvim_set_keymap(
	"n",
	"<leader>l",
	":lua OpenLocal()<CR>",
	{ noremap = true, silent = true, desc = "Open diagnostic [L]ocal list" }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what soGmeone will guess without a bit more experience.
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

-- Buffers
vim.keymap.set("n", "<C-Right>", ":BufferLineCycleNext<CR>", { desc = "Toggle next buffer" })
vim.keymap.set("n", "<C-Left>", ":BufferLineCyclePrev<CR>", { desc = "Toggle previous buffer" })
vim.keymap.set("n", "<leader>bcl", ":BufferLineCloseLeft<CR>", { desc = "Toggle previous buffer" })
vim.keymap.set("n", "<leader>bcr", ":BufferLineCloseRight<CR>", { desc = "Toggle previous buffer" })
vim.keymap.set("n", "<leader>bco", ":BufferLineCloseOthers<CR>", { desc = "Toggle previous buffer" })

--Marks
vim.keymap.set("n", "m1", "mA")
vim.keymap.set("n", "m2", "mB")
vim.keymap.set("n", "m3", "mC")
vim.keymap.set("n", "m4", "mD")

vim.keymap.set("n", "<leader>m1", "'A")
vim.keymap.set("n", "<leader>m2", "'B")
vim.keymap.set("n", "<leader>m3", "'C")
vim.keymap.set("n", "<leader>m4", "'D")
