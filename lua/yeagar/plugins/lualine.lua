local present, lualine = pcall(require, "lualine")

if not present then
	return
end

local colors = {
	bg = "#232232",
	fg = "#cdd6f4",
	none = "",
	cyan = "#89dceb",
	black = "#181825",
	gray = "#45475a",
	magenta = "#cba6f7",
	pink = "#f5c2e7",
	red = "#f38ba8",
	green = "#a6e3a1",
	yellow = "#f9e2af",
	blue = "#89b4fa",
	orange = "#fab387",
	black4 = "#585b70",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.bg, bg = colors.blue },
		b = { fg = colors.fg, bg = colors.gray },
		c = { fg = colors.fg, bg = colors.none },
	},

	insert = { a = { fg = colors.black, bg = colors.red } },
	visual = { a = { fg = colors.black, bg = colors.green } },
	replace = { a = { fg = colors.black, bg = colors.orange } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.black, bg = colors.black },
	},
}
--- Show when Macro recording ---
local function setup_macro_refresh(lualine)
	vim.api.nvim_create_autocmd("RecordingEnter", {
		callback = function()
			lualine.refresh({
				place = { "statusline" },
			})
		end,
	})
	vim.api.nvim_create_autocmd("RecordingLeave", {
		callback = function()
			local timer = vim.loop.new_timer()
			timer:start(
				50,
				0,
				vim.schedule_wrap(function()
					lualine.refresh({
						place = { "statusline" },
					})
				end)
			)
		end,
	})
end

local function macro_recording_status()
	local function current_status()
		local register = vim.fn.reg_recording()
		return register == "" and "" or "RECORDING @" .. register
	end
	return { "macro-recording", fmt = current_status }
end
setup_macro_refresh(lualine)

lualine.setup({
	options = {
		theme = "auto",
		component_separators = " ",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "", right = "" }, right_padding = 2 },
			macro_recording_status(),
		},
		lualine_b = {
			"branch",
			"diff",
		},
		lualine_c = { "filename", "diagnostics" },
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = {
			{ "location", color = { gui = "bold" }, separator = { right = "", left = "" }, left_padding = 2 },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "filename" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "quickfix", "nvim-tree" },
})
