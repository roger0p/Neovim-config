local M = {}

M.base46 = {
	theme = "gruvchad",
	transparency = false,
	integrations = { "hop" },
	hl_override = {
		Comment = {
			italic = true,
		},
	},
}

M.ui = {
	cmp = {
		icons_left = true, -- only for non-atom styles!
		lspkind_text = false,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		format_colors = {
			tailwind = true, -- will work for css lsp too
			icon = "󱓻",
		},
	},
	telescope = { style = "borderless" }, -- borderless / bordered
	statusline = {
		enabled = true,
		theme = "minimal", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "round",
	},
	tabufline = {
		enabled = true,
		lazyload = true,
		order = { "buffers", "tabs", "btns" },
		modules = nil,
	},
}

M.term = {
	winopts = { number = false },
	sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
	float = {
		row = 0.3,
		col = 0.25,
		width = 0.5,
		height = 0.4,
		border = "single",
	},
}
M.lsp = { signature = true }

M.cheatsheet = {
	theme = "grid", -- simple/grid
	excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
}
return M
