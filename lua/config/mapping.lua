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
map({ "n", "v" }, "<C-e>", "$")
map({ "n", "v" }, "<C-b>", "0")
map("i", "<C-e>", "<Esc>$i")
map("i", "<C-b>", "<Esc>0i")
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

----Splits
map("n", "hs", ":split<CR>")
map("n", "vs", ":vsplit<CR>")
----Terminal
map("n", "<leader>v", function()
	require("nvchad.term").new({ pos = "vsp" })
end, { desc = "Terminal in Vertical Split" })
map("n", "<leader>h", function()
	require("nvchad.term").new({ pos = "sp" })
end, { desc = "Terminal in Horizontal Split" })

--- toggleable terminal
map({ "n", "t" }, "<A-v>", function()
	require("nvchad.term").toggle({ pos = "vsp", id = "vtoggleTerm" })
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
	require("nvchad.term").toggle({ pos = "sp", id = "htoggleTerm" })
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "terminal toggle floating term" })

--greatest remap ever
map("x", "<leader>p", '"_dP', { desc = "Paste withouth yanking" })
map("n", "<leader>sr", ":%s/<C-r><C-w>//gc<left><Left><Left>", { desc = "Search and replace word under cursor" })

--next greatest remap (only for linux/not wsl)
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to system Clipboard" })
map("n", "<leader>Y", '"+Y')

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
map("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "File Tree", noremap = true, silent = true })

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

---TELESCOPE

map(
	"n",
	"<leader>ff",
	'<cmd>lua require("telescope.builtin").find_files()<cr>',
	{ desc = "Find Files", noremap = true, silent = true }
)
map(
	"n",
	"<leader>gt",
	'<cmd>lua require("telescope.builtin").git_files()<cr>',
	{ desc = "Git Files", noremap = true, silent = true }
)
map(
	"n",
	"<leader>fg",
	'<cmd>lua require("telescope.builtin").live_grep()<cr>',
	{ desc = "Find word | Grep", noremap = true, silent = true }
)
map(
	"n",
	"<leader>fb",
	'<cmd>lua require("telescope.builtin").buffers()<cr>',
	{ desc = "Find Buffer", noremap = true, silent = true }
)
map(
	"n",
	"<leader>fh",
	'<cmd>lua require("telescope.builtin").help_tags()<cr>',
	{ desc = "Find Help", noremap = true, silent = true }
)
map(
	"n",
	"<leader>k",
	'<cmd>lua require("telescope.builtin").oldfiles()<cr>',
	{ desc = "OldFiles", noremap = true, silent = true }
)
map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "Lsp Code Action", noremap = true, silent = true })

map(
	"n",
	"<leader>gd",
	'<cmd>lua require("telescope.builtin").lsp_definitions{}<cr>',
	{ desc = "Find Definition", noremap = true, silent = true }
)
map(
	"n",
	"<leader>gv",
	'<cmd>lua require("telescope.builtin").lsp_definitions{jump_type="vsplit"}<cr>',
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>gi",
	'<cmd>lua require("telescope.builtin").lsp_implementations{}<cr>',
	{ desc = "Find Implementations", noremap = true, silent = true }
)
map(
	"n",
	"<leader>fr",
	'<cmd>lua require("telescope.builtin").lsp_references{}<cr>',
	{ desc = "Lsp References", noremap = true, silent = true }
)
map(
	"n",
	"<leader>fm",
	'<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>',
	{ desc = "Lsp Symbols", noremap = true, silent = true }
)
map(
	"n",
	"<leader>dg",
	":Telescope diagnostics bufnr=0<cr>",
	{ desc = "Current Buffer diagnostics", noremap = true, silent = true }
)
map(
	"n",
	"<leader>fG",
	':execute "Telescope live_grep default_text=" . expand("<cword>")<cr>',
	{ desc = "Find word under cursor | Grep", noremap = true, silent = true }
)
map(
	"n",
	"<leader>fF",
	':execute "Telescope find_files default_text=" . "" . expand("<cword>")<cr>',
	{ desc = "Find files with the word under cursor", noremap = true, silent = true }
)
