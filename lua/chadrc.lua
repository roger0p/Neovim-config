local M = {}

M.base46 = {
  theme = "nightlamp",
  transparency = false,
  hl_override = {
    ["@comment"] = {
      italic = true,
    },
    ["@keyword"] = {
      bold = true,
      italic = true,
    },
  },
  changed_themes = {
    gruvchad = {
      base_16 = { base00 = "#121212" },
    },
  },
}

M.ui = {
  cmp = {
    icons_left = false, -- only for non-atom styles!
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = true, -- will work for css lsp too
      icon = "󱓻",
    },
  },
  telescope = { style = "bordered" }, -- borderless / bordered
  statusline = {
    enabled = true,
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
  },
  tabufline = {
    enabled = true,
    lazyload = false,
    order = { "buffers", "tabs" },
    modules = nil,
  },
}

M.term = {
  winopts = { number = false },
  sizes = { sp = 0.4, vsp = 0.4, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    row = 0.13,
    col = 0.15,
    width = 0.7,
    height = 0.7,
    border = "double",
  },
}

M.colorify = {
  enabled = true,
  mode = "virtual", -- fg, bg, virtual
  virt_text = "󱓻 ",
  highlight = { hex = true, lspvars = true },
}

M.lsp = { signature = true }

M.cheatsheet = {
  theme = "grid",                                                    -- simple/grid
  excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
}
return M
