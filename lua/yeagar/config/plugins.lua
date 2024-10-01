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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup()
		end,
	},
	{ "mbbill/undotree" },
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("yeagar.plugins.nvimtree")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		build = ":TSUpdate",
		config = function()
			require("yeagar.plugins.treesitter")
		end,
	},
	---LSP--
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("yeagar.plugins.lsp")
		end,
	},
	----Completion----
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("yeagar.plugins.cmp")
		end,
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			{
				"L3MON4D3/LuaSnip",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
					"rafamadriz/friendly-snippets",
				},
				version = "2.*",
				build = "make install_jsregexp",
			},
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				lightbulb = {
					enable = false,
				},
			})
		end,
	},
	----Formatter----
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
	},
	----UI----
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
	{ "christoomey/vim-tmux-navigator", event = "BufEnter" },
	{
		"kylechui/nvim-surround",
		event = "BufEnter",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"smoka7/hop.nvim",
		event = "BufEnter",
		opts = {
			keys = "etovxqpdygfblzhckisuran",
		},
	},
	{
		"akinsho/bufferline.nvim",
		after = "catppuccin",
		event = { "BufReadPost", "BufNewFile" },
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("yeagar.plugins.bufferline")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
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
		event = "BufEnter",
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
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		opts = {
			window = { backdrop = 0.7 },
			plugins = {
				gitsigns = true,
				tmux = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
	{
		"goolord/alpha-nvim",
		-- dependencies = { 'echasnovski/mini.icons' },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("yeagar.plugins.alpha")
		end,
	},
	-- lua with lazy.nvim
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		init = function()
			vim.opt.laststatus = 0
		end,
		config = function()
			require("yeagar.plugins.lualine")
		end,
	},
	--Colorschemes--`
	-- { "sainnhe/gruvbox-material" },
	-- { "ellisonleao/gruvbox.nvim" },
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "Everblush/nvim", name = "everblush" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("yeagar.config.colors")
		end,
	},
	-- { "rebelot/kanagawa.nvim" },
	-- { "tiagovla/tokyodark.nvim" },
}
