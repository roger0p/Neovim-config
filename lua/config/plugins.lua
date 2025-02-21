return {
  {
    "nvchad/ui",
    lazy = false,
    dependencies = {
      { "nvzone/volt" },
    },
    config = function()
      require("nvchad")
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "tris203/precognition.nvim",
    opts = {
      startVisible = false,
    },
    keys = {
      { "<leader>up", function() require("precognition").toggle() end, desc = "Precognition" },
    },
  },
  {
    "echasnovski/mini.nvim",
    event = "User FilePost",
    config = function()
      require("plugins.mini")
    end,
  },
  { "mbbill/undotree" },
  {
    "gelguy/wilder.nvim",
    event = { "User FilePost" },
    config = function()
      local wilder = require("wilder")
      wilder.setup({ modes = { ":", "/", "?" } })
      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlights = {
            border = 'Normal', -- highlight to use for the border
          },
          -- 'single', 'double', 'rounded' or 'solid'
          -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
          border = 'rounded',
        })
      ))
    end
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "User FilePost" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({
        signs = {
          delete = { text = "󰍵" },
          changedelete = { text = "󱕖" },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },
  ---LSP--
  {
    "neovim/nvim-lspconfig",
    event = { "User FilePost" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.lsp")
    end,
  },
  ----Completion----
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("plugins.cmp")
    end,
    dependencies = {
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "windwp/nvim-ts-autotag",
      "nvim-tree/nvim-web-devicons",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      },
      {
        "Exafunction/codeium.nvim",
        config = function()
          require("codeium").setup({})
        end,
      },
      {
        "supermaven-inc/supermaven-nvim",
        config = function()
          require("supermaven-nvim").setup({
            keymaps = {
              accept_suggestion = "<C-Space>",
            },
          })
        end,
      },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        lightbulb = {
          enable = false,
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    event = "LspAttach",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },
  ----Formatter----
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
  },
  ----UI----
  { "christoomey/vim-tmux-navigator", event = "BufEnter" },
  {
    "smoka7/hop.nvim",
    event = "BufReadPost",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
  {
    "tiagovla/scope.nvim",
    event = "User FilePost",
    config = function()
      require("scope").setup()
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    import = "plugins.snacks",
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
  -- {
  --   "goolord/alpha-nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("plugins.alpha")
  --   end,
  -- },
  --- lua with lazy.nvim
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- {
  -- 	"nvim-lualine/lualine.nvim",
  -- 	event = { "BufReadPost", "BufNewFile" },
  -- 	dependencies = { "nvim-tree/nvim-web-devicons" },
  -- 	init = function()
  -- 		vim.opt.laststatus = 0
  -- 	end,
  -- 	config = function()
  -- 		require("plugins.lualine")
  -- 	end,
  -- },
  ---Colorschemes---
  -- {
  -- 	"catppuccin/nvim",
  -- 	name = "catppuccin",
  -- 	dependencies = {
  -- 		{ "rose-pine/neovim", name = "rose-pine" },
  -- 		{ "Everblush/nvim", name = "everblush" },
  -- 		"sainnhe/gruvbox-material",
  -- 		"rebelot/kanagawa.nvim",
  -- 		"tiagovla/tokyodark.nvim",
  -- 	},
  -- 	config = function()
  -- 		require("config.colors")
  -- 	end,
  -- },
}
