vim.lsp.enable({
	"lua_ls",
	"clangd",
	"html",
	"cssls",
	"emmet_language_server",
  "tinymist",
})

vim.diagnostic.config({
	float = {
		focusable = true,
		style = "minimal",
		border = "solid",
		source = true,
		header = "",
		prefix = "",
	},
	virtual_text = false,
	virtual_lines = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

vim.lsp.inlay_hint.enable(true)
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config("*", {
	capabilities = lsp_capabilities,
})

local blink_status_ok, blink = pcall(require, "blink.cmp")
if blink_status_ok then
	local ext_capabilities = vim.tbl_deep_extend("force", {}, lsp_capabilities, blink.get_lsp_capabilities())
	vim.lsp.config("*", {
		capabilities = ext_capabilities,
	})
end

local keymap = vim.keymap
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		local sp = require("snacks.picker")

		-- LSP
		opts.desc = "Show LSP references"
		keymap.set("n", "<leader>lr", sp.lsp_references, opts)

		opts.desc = "Go to declaration"
		keymap.set("n", "<leader>lD", sp.lsp_declarations, opts)

		opts.desc = "Show LSP definitions"
		keymap.set("n", "<leader>ld", sp.lsp_definitions, opts)

		opts.desc = "Show LSP implementations"
		keymap.set("n", "<leader>li", sp.lsp_implementations, opts)

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "<leader>lt", sp.lsp_type_definitions, opts)

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

		-- Rename
		opts.desc = "Smart rename"
		keymap.set("n", "<leader>da", vim.lsp.buf.rename, opts)

		-- Diagnostics
		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>dd", sp.diagnostics, opts)

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>dl", vim.diagnostic.open_float, opts)

		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "<leader>dk", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "<leader>dj", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)

		-- Hover docs
		opts.desc = "Show documentation under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
lsp})
