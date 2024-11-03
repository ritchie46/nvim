local base_color = "base00"
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
				-- BASE
				Identifier = { fg = colors[base_color] },
				Parameter = { fg = colors.base01, italic = false, bold = false },
				Function = { fg = colors[base_color] },
				-- VIOLET
				Constant = { fg = colors.violet, italic = true },
				Property = { fg = colors.violet },
				-- BLUE
				Type = { fg = colors.blue, bold = false },
				-- GREEN
				KeyWord = { fg = colors.green },
				Include = { fg = colors.green },
				-- RED
				Number = { fg = colors.red, italic = false },
				-- CYAN
				String = { fg = colors.cyan },
				-- YELLOW
				Special = { fg = colors.yellow },
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
		--
		-- LIGHT GREY
		vim.api.nvim_set_hl(0, "@lsp.type.comment", { bg = "none", fg = colors.base1, italic = true })

		-- BASE
		local base_color = colors[base_color]
		vim.api.nvim_set_hl(0, "@module", { fg = base_color })
		vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = base_color })
		vim.api.nvim_set_hl(0, "@function.call", { fg = base_color })
		vim.api.nvim_set_hl(0, "@function.method.call", { fg = base_color })
		vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = base_color })
		vim.api.nvim_set_hl(0, "@lsp.mod.static", { fg = base_color })
		vim.api.nvim_set_hl(0, "@lsp.type.decorator", { fg = base_color })
		vim.api.nvim_set_hl(0, "@lsp.typemod.method.reference", { fg = base_color })
		vim.api.nvim_set_hl(0, "@lsp.typemod.method.library", { fg = base_color })
		vim.api.nvim_set_hl(0, "NonText", { bg = "none", fg = base_color })

		-- YELLOW
		vim.api.nvim_set_hl(0, "@function.macro", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "@lsp.type.macro.rust", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "@punctuation.Special", { fg = colors.yellow })
		vim.api.nvim_set_hl(0, "@lsp.mod.attribute.rust", { fg = colors.yellow })

		-- GREEN
		vim.api.nvim_set_hl(0, "@variable.Builtin", { fg = colors.green })

		-- CYAN
		vim.api.nvim_set_hl(0, "@lsp.type.lifetime.rust", { fg = colors.cyan })

		-- BLUE
		vim.api.nvim_set_hl(0, "@lsp.typemod.derive.attribute", { fg = colors.blue })

		-- VIOLET
		vim.api.nvim_set_hl(0, "@lsp.typemod.enumMember", { fg = colors.violet })
		vim.api.nvim_set_hl(0, "@lsp.type.enumMember", { fg = colors.violet })

		-- MAGENTA
		vim.api.nvim_set_hl(0, "@lsp.type.method.declaration", { fg = colors.magenta })
		vim.api.nvim_set_hl(0, "@lsp.typemod.method.declaration", { fg = colors.magenta })
		vim.api.nvim_set_hl(0, "@lsp.typemod.function.declaration", { fg = colors.magenta })
	end,
}
