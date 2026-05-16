return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"onsails/lspkind.nvim",
		},

		version = "1.*",
		config = function()
			require("lspkind").init({
				mode = "symbol_text",

				symbol_map = {
					Array = " ",
					Boolean = " ",
					Class = " ",
					Color = " ",
					Constant = " ",
					Constructor = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Folder = "󰉋 ",
					Function = " ",
					Interface = " ",
					Key = " ",
					Keyword = " ",
					Method = " ",
					-- Module = " ",
					Module = " ",
					Namespace = " ",
					Null = "󰟢",
					Number = " ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					Reference = " ",
					Snippet = " ",
					String = " ",
					Struct = " ",
					Text = " ",
					TypeParameter = " ",
					Unit = " ",
					Value = " ",
					Variable = " ",
					Codeium = "󰚩 ",
					Copilot = " ",
					LazyDev = "b ",
				},
			})

			local opts = {
				cmdline = {
					keymap = {
						preset = "inherit",
						["<C-j>"] = { "select_next", "fallback" },
						["<C-k>"] = { "select_prev", "fallback" },
					},
				},

				keymap = {
					preset = "default",
					["<C-k>"] = { "select_prev", "fallback" },
					["<C-j>"] = { "select_next", "fallback" },
					["<CR>"] = { "select_and_accept", "fallback" },
				},

				fuzzy = {
					implementation = "prefer_rust_with_warning",
				},

				completion = {
					menu = {
						draw = {
							components = {
								kind_icon = {
									text = function(item)
										local kind = require("lspkind").symbol_map[item.kind] or ""
										return kind .. ""
									end,
								},
							},
						},
					},

					documentation = { auto_show = true },
				},
				sources = {
					default = { "lsp", "path", "buffer" },
				},
			}
			require("blink.cmp").setup(opts)
		end,
	},
}
