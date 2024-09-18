local present, telescope = pcall(require, "telescope")

if not present then
	return
end
local actions = require("telescope.actions")
telescope.setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
			},
			width = 0.87,
			height = 0.80,
		},
		mappings = {
			n = {
				["q"] = actions.close,
				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
			},
			i = {
				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
	},
})
