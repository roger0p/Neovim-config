return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("yeagar.plugins.telescope")
		end,
	},
	-- {
	-- 	"folke/trouble.nvim",
	-- 	opts = {}, -- for default options, refer to the configuration section for custom setup.
	-- 	cmd = "Trouble",
	-- 	config = function()
	-- 		require("yeagar.plugins.trouble")
	-- 	end,
	-- },
	{ "mbbill/undotree" },
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()
		end,
	},
	-- { "tpope/vim-fugitive" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("yeagar.plugins.treesitter")
		end,
	},
	---LSP--
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("yeagar.plugins.lsp")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "windwp/nvim-ts-autotag", event = "VeryLazy" },
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{ "dstein64/vim-startuptime", event = "VeryLazy" },
	{
		"smoka7/hop.nvim",
		event = "VeryLazy",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("yeagar.plugins.bufferline")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	-- 	branch = "v3.x",
	-- 	config = function()
	-- 		require("yeagar.plugins.neotree")
	-- 	end,
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	-- 	},
	-- },
	-- {
	-- 	"s1n7ax/nvim-window-picker",
	-- 	version = "2.*",
	-- 	config = function()
	-- 		require("window-picker").setup({
	-- 			filter_rules = {
	-- 				include_current_win = false,
	-- 				autoselect_one = true,
	-- 				-- filter using buffer options
	-- 				bo = {
	-- 					-- if the file type is one of following, the window will be ignored
	-- 					filetype = { "neo-tree", "neo-tree-popup", "notify" },
	-- 					-- if the buffer type is one of following, the window will be ignored
	-- 					buftype = { "terminal", "quickfix" },
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	-- dependencies = { 'echasnovski/mini.icons' },
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("yeagar.plugins.alpha")
	-- 	end,
	-- },
	-- lua with lazy.nvim
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("yeagar.plugins.lualine")
		end,
	},
	--Colorschemes--`
	{ "sainnhe/gruvbox-material" },
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			require("yeagar.config.colors")
		end,
	},
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "catppuccin/nvim", name = "catppuccin" },
	-- { "rebelot/kanagawa.nvim" },
	-- { "Everblush/nvim", name = "everblush" },
	-- { "tiagovla/tokyodark.nvim" },
}
