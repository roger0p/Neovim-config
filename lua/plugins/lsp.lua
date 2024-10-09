---------------------
--- MASON-LSP -------
---------------------

require("mason").setup({
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
})

local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", {})
	vim.keymap.set("n", "gd", "<CMD>Lspsaga goto_definition<CR>", {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>", {})
	vim.keymap.set("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", {})
	vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua require('conform').format()<cr>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

-- local servers = { "html", "cssls", "ts_ls", "clangd", "tailwindcss", "emmet_ls", "pyright", "bashls" }
--
-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup({
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 		capabilities,
-- 	})
-- end
--
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
lspconfig.bashls.setup({})
-------------------
---- Formatter ----
-------------------
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
	format_on_save = function(bufnr)
		-- Disable autoformat on certain filetypes
		local ignore_filetypes = { "sql", "java" }
		if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
			return
		end
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		-- Disable autoformat for files in a certain path
		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if bufname:match("/node_modules/") then
			return
		end
		-- ...additional logic...
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})