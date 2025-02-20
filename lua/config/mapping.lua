vim.g.mapleader = " "
local map = vim.keymap.set

-- map("i", "jk", "<Esc>")
map("n", "<M-Up>", "<CMD>m -2<CR>")
map("n", "<M-Down>", "<CMD>m +1<CR>")
map("n", "<M-k>", "<CMD>m -2<CR>")
map("n", "<M-j>", "<CMD>m +1<CR>")

map("n", ";", ":")
map("n", "J", "mzJ`z")
map("n", "<C-a>", "0ggvG$")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map({ "n", "i" }, "<C-b>", "<ESC>^", { desc = "move beginning of line" })
map({ "n", "i" }, "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

---- Menu
---- Keyboard users
map("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec('"normal! \\<RightMouse>"')

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})
--Splits
map("n", "hs", ":split<CR>")
map("n", "vs", ":vsplit<CR>")
----Terminal
map("n", "<leader>v", function()
  require("nvchad.term").new({ pos = "vsp", cmd = "fastfetch" })
end, { desc = "Terminal in Vertical Split" })
map("n", "<leader>h", function()
  require("nvchad.term").new({ pos = "sp", cmd = "fastfetch" })
end, { desc = "Terminal in Horizontal Split" })

--- toggleable terminal
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm", cmd = "fastfetch" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm", cmd = "fastfetch" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle({ pos = "float", id = "floatTerm", cmd = "fastfetch" })
end, { desc = "terminal toggle floating term" })

--greatest remap ever
map("x", "<leader>p", '"_dP', { desc = "Paste withouth yanking" })
map("n", "<leader>sr", ":%s/<C-r><C-w>//gc<left><Left><Left>", { desc = "Search and replace word under cursor" })

--next greatest remap (only for linux/not wsl)
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system Clipboard" })
map("n", "<leader>Y", '"+Y')

map({ "n", "x" }, "<F3>", "<cmd>lua require('conform').format()<cr>", { noremap = true, silent = true })
map("n", "<leader>Q", vim.cmd.qall, { desc = "Quit Neovim" })
map("n", "<leader>q", ":bdelete<CR>", { desc = "Close Buffer" })
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
map("n", "<leader>R", function()
  local swapBoolean = function()
    local c = vim.api.nvim_get_current_line()
    local subs = c:match("true") and c:gsub("true", "false") or c:gsub("false", "true")
    vim.api.nvim_set_current_line(subs)
  end
  swapBoolean()
end, { desc = "Swap True:False", noremap = true, silent = true })

--Hop.nvim
map("n", "gf", vim.cmd.HopChar1, { desc = "Find letter in view", noremap = true, silent = true })
map("n", "gt", vim.cmd.HopChar2, { desc = "Find two letters in view", noremap = true, silent = true })

---NVUI---
map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "Change theme", noremap = true, silent = true })

-- tabufline
map("n", "<leader>b", "<cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<leader><Tab>", "<cmd>tabnext<CR>", { desc = "Next Tab" })
map("n", "<leader><S-Tab>", "<cmd>tabprevious<CR>", { desc = "Previos Tab" })

---NvimTree
map("n", "<leader>n", ":lua MiniFiles.open()<CR>", { desc = "File Tree", noremap = true, silent = true })

-- --Harpoon
map("n", "<leader>P", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "List Harpoons", noremap = true, silent = true })
map("n", "za", function()
  require("harpoon.mark").add_file()
end, { desc = "Add Harpoon", noremap = true, silent = true })
map("n", "zn", function()
  require("harpoon.ui").nav_next()
end, { desc = "Next Harpoon", noremap = true, silent = true })
map("n", "zp", function()
  require("harpoon.ui").nav_prev()
end, { desc = "Previos Harpoon", noremap = true, silent = true })
--
--UndoTree
map("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "toggle undotree", noremap = true, silent = true })
