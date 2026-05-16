return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				highlight = { enable = true },
				-- Language parsers
				ensure_installed = {
					"lua",
					"javascript",
					"html",
					"css",
					"cpp",
					"c",
				},
			})
		end,
	},
}
