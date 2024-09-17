local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

local options = {
	ensure_installed = { "javascript", "typescript", "lua", "html", "css", "python" },

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = true,
	},
}

treesitter.setup(options)
