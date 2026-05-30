return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")

		mason.setup({
			ui = {
				border = "solid",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Language Server
				"lua_ls",
				"clangd",
				"html",
				"cssls",
				"emmet_language_server",
				"emmet_ls",
				-- Format
				"prettier",
				"stylua",
				"clang-format",
			},
		})
	end,
}
