local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "v", api.node.open.vertical, opts("Open vertical"))
end

-- pass to setup along with your other options
require("nvim-tree").setup({
	filters = { dotfiles = false },
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	sort = {
		sorter = "name",
		folders_first = true,
		files_first = false,
	},
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		width = 30,
		preserve_window_proportions = true,
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true,
		indent_markers = { enable = true },
		icons = {
			git_placement = "signcolumn",
			glyphs = {
				default = "󰈚",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					renamed = "",
					untracked = "",
					deleted = "",
					ignored = "◌",
					unmerged = "",
				},
			},
		},
	},
	on_attach = my_on_attach,
})
