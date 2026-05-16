return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				css = { "prettier" },
				lua = { "stylua" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				tex = { "latexindent" },
				["*"] = { "trim_whitespace" },
			},

			default_format_opts = {
				lsp_format = "fallback",
			},

			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>lf", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
