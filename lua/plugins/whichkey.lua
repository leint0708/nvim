return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		preset = "helix",
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		win = {
			border = "solid",
			no_overlap = false,
			padding = { 0, 2 },
			title = false,
			title_pos = "center",
			zindex = 1000,
		},
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>b", group = "buffers" },
			{ "<leader>d", group = "diagnostics" },
			{ "<leader>f", group = "finder" },
			{ "<leader>s", group = "searcher & split" },
			{ "<leader>l", group = "lsp" },
			{ "<leader>g", group = "git" },
			{ "<leader>k", group = "live server" },
		})
	end,
}
