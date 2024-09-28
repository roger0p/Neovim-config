-- -- Default options:
-- require("gruvbox").setup({
-- 	terminal_colors = true, -- add neovim terminal colors
-- 	undercurl = true,
-- 	underline = true,
-- 	bold = true,
-- 	italic = {
-- 		keyword = true,
-- 		comments = true,
-- 		operators = false,
-- 		folds = true,
-- 	},
-- 	strikethrough = true,
-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
-- 	contrast = "hard", -- can be "hard", "soft" or empty string
-- 	palette_overrides = {},
-- 	overrides = {},
-- 	dim_inactive = false,
-- 	transparent_mode = true,
-- })
-- vim.g.gruvbox_material_transparent_background = 2
-- vim.g.gruvbox_material_foreground = "material"
-- vim.g.gruvbox_material_background = "hard"
-- vim.g.gruvbox_material_enable_italic = 1

require("catppuccin").setup({
	background = {
		light = "latte",
		dark = "mocha",
	},
	color_overrides = {
		latte = {
			rosewater = "#c14a4a",
			flamingo = "#c14a4a",
			red = "#c14a4a",
			maroon = "#c14a4a",
			pink = "#945e80",
			mauve = "#945e80",
			peach = "#c35e0a",
			yellow = "#b47109",
			green = "#6c782e",
			teal = "#4c7a5d",
			sky = "#4c7a5d",
			sapphire = "#4c7a5d",
			blue = "#45707a",
			lavender = "#45707a",
			text = "#654735",
			subtext1 = "#73503c",
			subtext0 = "#805942",
			overlay2 = "#8c6249",
			overlay1 = "#8c856d",
			overlay0 = "#a69d81",
			surface2 = "#bfb695",
			surface1 = "#d1c7a3",
			surface0 = "#e3dec3",
			base = "#f9f5d7",
			mantle = "#f0ebce",
			crust = "#e8e3c8",
		},
		mocha = {
			rosewater = "#ea6962",
			flamingo = "#ea6962",
			red = "#ea6962",
			maroon = "#ea6962",
			pink = "#d3869b",
			mauve = "#d3869b",
			peach = "#e78a4e",
			yellow = "#d8a657",
			green = "#a9b665",
			teal = "#89b482",
			sky = "#89b482",
			sapphire = "#89b482",
			blue = "#7daea3",
			lavender = "#7daea3",
			text = "#ebdbb2",
			subtext1 = "#d5c4a1",
			subtext0 = "#bdae93",
			overlay2 = "#a89984",
			overlay1 = "#928374",
			overlay0 = "#595959",
			surface2 = "#4d4d4d",
			surface1 = "#404040",
			surface0 = "#292929",
			base = "#1d2021",
			mantle = "#191b1c",
			crust = "#141617",
		},
	},
	transparent_background = true,
	show_end_of_buffer = false,
	integration_default = false,
	styles = {
		keywords = { "italic" },
	},
	integrations = {
		alpha = true,
		barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
		cmp = true,
		gitsigns = true,
		hop = true,
		illuminate = { enabled = true },
		native_lsp = { enabled = true, inlay_hints = { background = true } },
		neogit = true,
		neotree = true,
		semantic_tokens = true,
		treesitter = true,
		treesitter_context = true,
		vimwiki = true,
		which_key = true,
	},
})

vim.api.nvim_command("colorscheme catppuccin")
