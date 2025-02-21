----
---- Autocompletion setup
----
local present, cmp = pcall(require, "cmp")

if not present then
  return
end

local luasnip = require("luasnip")
local suggestion = require("supermaven-nvim.completion_preview")
local lspkind = require("lspkind")

require("luasnip.loaders.from_vscode").lazy_load()

local options = {
  completion = { completeopt = "menu,menuone" },
  window = {
    completion = cmp.config.window.bordered({
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      scrollbar = false,
      winhighlight = "Normal:Normal,FloatBorder:CmpWinBorder,CursorLine:PmenuSel,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
      scrollbar = false,
      winhighlight = "Normal:Normal,FloatBorder:CmpWinBorder,CursorLine:PmenuSel,Search:None",
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "supermaven" },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({ -- confirm completion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- scroll up and down the documentation window
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif suggestion.has_suggestion() then
        suggestion.on_accept_suggestion()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format({
      mode = "symbol",       -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      symbol_map = { Supermaven = "󱘆" },
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      before = function(_, vim_item)
        return vim_item
      end,
    }),
  },
}

options = vim.tbl_deep_extend("force", options, require("nvchad.cmp"))
require("cmp").setup(options)
