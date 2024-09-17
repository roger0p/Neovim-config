-- -- Default options:
require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})
-- values shown are defaults and will be used if not provided
-- require('gruvbox-material').setup({
--   italics = true,             -- enable italics in general
--   contrast = "hard",        -- set contrast, can be any of "hard", "medium", "soft"
--   comments = {
--     italics = true,           -- enable italic comments
--   },
--   background = {
--     transparent = true,      -- set the background to transparent
--   },
--   float = {
--     force_background = false, -- force background on floats even when background.transparent is set
--     background_color = nil,   -- set color for float backgrounds. If nil, uses the default color set
--                               -- by the color scheme
--   },
--   signs = {
--     highlight = true,         -- whether to highlight signs
--   },
--   customize = nil,            -- customize the theme in any way you desire, see below what this
--                               -- configuration accepts
-- })
vim.g.gruvbox_material_transparent_background = 2
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_background = "hard"
vim.cmd("colorscheme gruvbox-material")
-- vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")
