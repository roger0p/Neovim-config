vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.cursorline = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 20
vim.opt.wrap = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.background = "dark"
-- vim.opt.list = true
vim.opt.fillchars = { eob = " " }

vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.ruler = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
-- vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.whichwrap:append("<>[]hl")

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.o.timeoutlen = 400
vim.opt.shortmess:append("sI")
