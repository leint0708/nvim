return {
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "ys",
					delete = "ds",
					replace = "cs",

					find = "",
					find_left = "",
					highlight = "",
					update_n_lines = "",

					suffix_last = "",
					suffix_next = "",
				},
			})
		end,
	},
}
