return {
	{ -- conform
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},

				format_on_save = function()
					return { timeout_ms = 500, lsp_fallback = true }
				end,
			})
		end,
	},

	{ -- nvim-lint
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				lua = { "luacheck" },
			}
		end,
	},
}
