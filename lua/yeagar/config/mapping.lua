vim.g.mapleader = " "
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- map("i", "jk", "<Esc>")
map("n", "<M-Up>", "<CMD>m -2<CR>")
map("n", "<M-Down>", "<CMD>m +1<CR>")
map("n", "<M-k>", "<CMD>m -2<CR>")
map("n", "<M-j>", "<CMD>m +1<CR>")

map("n", "J", "mzJ`z")
map("n", "<C-a>", "0ggvG$")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map({ "n", "v" }, "<C-e>", "$")
map({ "n", "v" }, "<C-b>", "0")
map("i", "<C-e>", "<Esc>$i")
map("i", "<C-b>", "<Esc>")
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

----Splits
map("n", "hs", ":split<CR>")
map("n", "vs", ":vsplit<CR>")
----Terminal
map("n", "<leader>v", ":vs +terminal | startinsert<CR>")
map("n", "<leader>h", ":split +terminal | startinsert<CR>")

--greatest remap ever
map("x", "<leader>p", '"_dP')
map("n", "<leader>sr", ":%s/<C-r><C-w>//gc<left><Left><Left>")

--next greatest remap (only for linux/not wsl)
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

map("n", "<leader>q", vim.cmd.q)
map("n", "<leader>x", ":bdelete<CR>")
map("n", "<C-s>", ":w<CR>", opts)
map("n", "<leader>R", function()
	local swapBoolean = function()
		local c = vim.api.nvim_get_current_line()
		local subs = c:match("true") and c:gsub("true", "false") or c:gsub("false", "true")
		vim.api.nvim_set_current_line(subs)
	end
	swapBoolean()
end)

--Hop.nvim
map("", "gf", vim.cmd.HopChar1)
map("", "gt", vim.cmd.HopChar1)

--NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

-- --Harpoon
map("n", "<leader>P", function()
	require("harpoon.ui").toggle_quick_menu()
end)
map("n", "za", function()
	require("harpoon.mark").add_file()
end)
map("n", "zn", function()
	require("harpoon.ui").nav_next()
end)
map("n", "zp", function()
	require("harpoon.ui").nav_prev()
end)
--
--UndoTree
map("n", "<leader>U", vim.cmd.UndotreeToggle)

---TELESCOPE

map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").git_files()<cr>', opts)
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map("n", "<leader>k", '<cmd>lua require("telescope.builtin").oldfiles()<cr>', opts)
map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)

map("n", "<leader><leader>a", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opts)
map("n", "<leader>gd", '<cmd>lua require("telescope.builtin").lsp_definitions{}<cr>', opts)
map("n", "<leader>gv", '<cmd>lua require("telescope.builtin").lsp_definitions{jump_type="vsplit"}<cr>', opts)
map("n", "<leader>gi", '<cmd>lua require("telescope.builtin").lsp_implementations{}<cr>', opts)
map("n", "<leader>fr", '<cmd>lua require("telescope.builtin").lsp_references{}<cr>', opts)
-- map("n", "<leader>f", '<cmd>lua require("telescope.builtin").lsp_document_symbols{}<cr>', opts)
map("n", "<leader>fm", '<cmd>lua require("telescope.builtin").lsp_document_symbols{symbols="method"}<cr>', opts)
map("n", "<leader>dg", ":Telescope diagnostics bufnr=0<cr>", opts)
map("n", "<leader>fG", ':execute "Telescope live_grep default_text=" . expand("<cword>")<cr>', opts)
map("n", "<leader>fS", ':execute "Telescope grep_string default_text=" . expand("<cword>")<cr>', opts)
map("n", "<leader>fF", ':execute "Telescope find_files default_text=" . "" . expand("<cword>")<cr>', opts)
