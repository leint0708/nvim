return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- utility
		bigfile = { enabled = true },
		statuscolumn = { enabled = true },
		notifier = { enabled = true },
		-- terminal
		terminal = {},
		-- dashboard
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		-- explorer
		explorer = { enabled = true },
		-- indent
		indent = {
			enabled = true,
			char = "│",
			hl = {
				"SnacksIndent1",
				"SnacksIndent2",
				"SnacksIndent3",
				"SnacksIndent4",
				"SnacksIndent5",
				"SnacksIndent6",
				"SnacksIndent7",
				"SnacksIndent8",
			},
			scope = {
				enabled = true,
				priority = 200,
				char = "│",
				underline = false,
				only_current = false,
				hl = "SnacksIndentScope",
			},
			chunk = {
				enabled = true,
				only_current = false,
				priority = 200,
				hl = "SnacksIndentChunk",
				char = {
					corner_top = "┌",
					corner_bottom = "└",
					horizontal = "─",
					vertical = "│",
					arrow = "─",
				},
			},
		},
		-- input
		input = {
			enabled = true,
			icon = " ",
			icon_hl = "SnacksInputIcon",
			icon_pos = "left",
			prompt_pos = "title",
			win = { style = "input" },
			expand = true,
		},
		-- picker
		picker = {
			enabled = true,
			sources = {
				explorer = {
					git_status = true,
					git_status_open = false,
					auto_close = true,
					layout = "custom",
					layouts = {
						custom = {
							layout = {
								backdrop = false,
								width = 40,
								min_width = 40,
								height = 0,
								position = "left",
								border = "none",
								box = "vertical",
								{
									win = "input",
									height = 1,
									border = "solid",
									title = "{title} {live} {flags}",
									title_pos = "center",
								},
								{ win = "list", border = "none" },
								{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
							},
						},
					},
				},
			},
			prompt = "  ",
			layout = "custom",
			layouts = {
				custom = {
					layout = {
						box = "horizontal",
						backdrop = true,
						width = 0.8,
						height = 0.9,
						{
							box = "vertical",
							{ win = "list", title = " Results ", title_pos = "center", border = "solid" },
							{
								win = "input",
								height = 1,
								border = "solid",
								title = "{title} {live} {flags}",
								title_pos = "center",
							},
						},
						{
							win = "preview",
							title = "{preview:Preview}",
							width = 0.45,
							border = "solid",
							title_pos = "center",
						},
					},
				},
			},
			matcher = { cwd_bonus = false, frequency = true },
			formatters = {
				file = {
					filename_first = true,
					filename_only = false,
					icon_width = 2,
				},
			},
		},
		lazygit = {
			configure = true,
			config = {
				os = { editPreset = "nvim-remote" },
				gui = {
					nerdFontsVersion = "3",
				},
			},
			win = {
				style = "lazygit",
			},
		},
	},

	keys = {
		-- dashboard
		{
			"<leader><ESC>",
			function()
				Snacks.dashboard()
			end,
			desc = "Dashboard",
		},
		-- explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find everything
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- grep
		{
			"<leader>sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymap",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help",
		},
		-- lazy git
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		-- terminal
		{
			"<leader>tt",
			function()
				Snacks.terminal.open()
			end,
			desc = "Terminal",
		},
	},
}
