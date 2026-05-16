return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local colors = {
			bg = "#1e1e2e",
			fg = "#cdd6f4",
			yellow = "#f9e2af",
			cyan = "#f9e2af",
			darkblue = "#b4befe",
			green = "#a6e3a1",
			orange = "#fab387",
			violet = "#cba6f7",
			magenta = "#f5c2e7",
			blue = "#89b4fa",
			red = "#f38ba8",
			add = "#94e2d5",
			change = "#f2cdcd",
			delete = "#eba0ac",
		}

		local mode_color = {
			n = colors.blue,
			i = colors.green,
			v = colors.red,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}

		require("lualine").setup({
			options = {
				globalstatus = true,
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{
						function()
							return "▊"
						end,
						color = function()
							return { fg = mode_color[vim.fn.mode()] }
						end,
						padding = { left = 0, right = 1 },
					},
					{
						function()
							return ""
						end,
						color = function()
							return { fg = mode_color[vim.fn.mode()] }
						end,
						padding = { right = 1 },
					},
					{
						"filename",
						cond = conditions.buffer_not_empty,
						color = { fg = colors.magenta, gui = "bold" },
					},
					"location",
					{
						"progress",
						color = { fg = colors.fg, gui = "bold" },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yellow },
							info = { fg = colors.cyan },
						},
					},
					{
						function()
							return "%="
						end,
					},
					{
						function()
							local msg = "No Active Lsp"
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return client.name
								end
							end
							return msg
						end,
						icon = " LSP:",
						color = { fg = "#1abc9c", gui = "bold" },
					},
				},
				lualine_x = {
					{
						"filetype",
						colored = true,
					},
					{
						"branch",
						icon = "",
						color = { fg = colors.violet, gui = "bold" },
					},
					{
						"diff",
						symbols = { added = " ", modified = "󰝤 ", removed = " " },
						diff_color = {
							added = { fg = colors.add },
							modified = { fg = colors.change },
							removed = { fg = colors.delete },
						},
						cond = conditions.hide_in_width,
					},
					{
						function()
							return "▊"
						end,
						color = function()
							return { fg = mode_color[vim.fn.mode()] }
						end,
						padding = { left = 1, right = 0 },
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {
					{
						"buffers",
						mode = 2,
						use_mode_colors = true,
						filetype_names = {
							snacks_dashboard = " Dashboard",
							lazy = "󰲋 Lazy",
							snacks_picker_input = " Picker",
							snacks_picker_list = " List",
							snacks_picker_preview = " Preview",
						},
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		})
	end,
}
