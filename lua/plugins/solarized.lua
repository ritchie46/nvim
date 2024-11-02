return {
	"maxmx03/solarized.nvim",
	lazy = false,
	priority = 1000,
	---@type solarized.config
	opts = {
		styles = {
			functions = { bold = false },
			types = { bold = false },
			keywords = { bold = false, italic = false },
			strings = { bold = false },
			comments = { bold = false },
			constants = { bold = false },
			statements = { bold = false },
		},
		-- GLobal highlight colors
		on_highlights = function(colors, color)
			local groups = {
				Identifier = { fg = colors.base01 },
				Parameter = { fg = colors.base01, italic = false, bold = false },
				Function = { fg = colors.magenta },
				Type = { fg = colors.blue, bold = false },
				Constant = { fg = colors.violet, italic = true },
				Property = { fg = colors.violet },
				KeyWord = { fg = colors.green },
				Number = { fg = colors.red, italic = false },
				String = { fg = colors.cyan },
				Special = { fg = colors.yellow },
				Include = { fg = colors.yellow },
				Define = { fg = colors.yellow },
				Builtin = { fg = colors.yellow },
			}
			return groups
		end,
	},
	config = function(_, opts)
		vim.o.termguicolors = true
		vim.o.background = "light"
		require("solarized").setup(opts)
		vim.cmd.colorscheme("solarized")
		-- Specific treesitter colors
		local utils = require("solarized.utils")
		local colors = utils.get_colors()
		vim.api.nvim_set_hl(0, "@function.macro", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "@lsp.type.macro.rust", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "@punctuation.Special", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "@variable.Builtin", { fg = colors.green })
		vim.api.nvim_set_hl(0, "@lsp.typemod.keyword", { fg = colors.green })

		vim.api.nvim_set_hl(0, "@attribute.rust", { fg = colors.cyan }) -- lifetime
		vim.api.nvim_set_hl(0, "@module", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@function.call", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@function.method.call", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@lsp.mod.public", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@lsp.mod.static", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@lsp.type.decorator", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@lsp.typemod.function.declaration", { fg = colors.base01 })
		vim.api.nvim_set_hl(0, "@lsp.typemod.enumMember", { fg = colors.violet })
		vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = colors.violet })
		vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = colors.magenta })
		vim.api.nvim_set_hl(0, "NonText", { bg = "none", fg = colors.base00 })
	end,
}
