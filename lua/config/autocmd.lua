-----------------------------
-- A U T O C O M M A N D S --
-----------------------------

local CursorLine = vim.api.nvim_create_augroup("CursorLine", { clear = true })
---------------------------------------------------------------------
-- TO HIGHLIGHT CURSORLINE WHICH IDK WHY NVCHAD DOESN'T BY DEFAULT --
---------------------------------------------------------------------
-- vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
-- 	command = "hi CursorLine guibg=#1a1b2c",
-- 	group = CursorLine,
-- })
vim.api.nvim_create_autocmd("InsertEnter", {
  command = "normal zz",
  group = CursorLine,
})

local autocmd = vim.api.nvim_create_autocmd


-- ~ Set Colorscheme if you don't like any of the NvChad themes ~ --
-- vim.api.nvim_create_autocmd("BufEnter", { command = "source ~/.config/nvim/lua/custom/init.lua", group = CursorLine })
-- vim.api.nvim_create_autocmd(
--   "BufEnter",
--   { command = "source ~/.config/nvim/lua/custom/plugins/lualine.lua", group = CursorLine }
-- )

----------------------------------------------------
-- TO CHANGE CURSORLINE COLOR WHEN IN INSERT MODE --
----------------------------------------------------
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	command = "hi CursorLine guibg=#2f2e3e",
-- 	group = CursorLine,
-- })
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	command = "hi CursorLine guibg=none",
-- 	group = CursorLine,
-- })
--
--------------------------------------------------------------
-- LIKE RUN FILE IN VSCODE BUT WITH SPECIFIC FILETYPES ONLY --
--------------------------------------------------------------
local RunFile = vim.api.nvim_create_augroup("RunFile", { clear = true })
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = "javascript", command = "nnoremap <leader><RETURN> :!node %<CR>", group = RunFile }
)
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = "python", command = "nnoremap <leader><RETURN> :!python3 %<CR>", group = RunFile }
)
--------------------------------
-- SOME SMALL SIMPLE AUTOCMDS --
--------------------------------
vim.api.nvim_create_augroup("custom", { clear = true })

-- user event that loads after UIEnter + only if file buf is there
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = vim.api.nvim_buf_get_name(args.buf)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name("NvFilePost")

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})

        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})
-----------------------------------------------
-- QUIT NVIM IF NVIM-TREE IS THE LAST BUFFER --
-----------------------------------------------
autocmd("BufEnter", {
  nested = true,
  group = "custom",
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

----------------------------------------------------------------------------------
-- RETURN TO LAST EDIT POSITION WHEN OPENING FILES AKA REMEMBER CURSOR POSITION --
----------------------------------------------------------------------------------

autocmd("BufReadPost", {
  pattern = "*",
  group = "custom",
  callback = function()
    local line = vim.fn.line("'\"")
    if
        line > 1
        and line <= vim.fn.line("$")
        and vim.bo.filetype ~= "commit"
        and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd('normal! g`"')
    end
  end,
})
-- reload config file on change
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = "custom",
-- 	pattern = vim.env.MYVIMRC,
-- 	command = "silent source %",
-- })

-- highlight yanks
autocmd("TextYankPost", {
  group = "custom",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

-- sync clipboards because I'm easily confused
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = "custom",
--   pattern = "*",
--   callback = function()
--     fn.setreg("+", fn.getreg "*")
--   end,
-- })

-- start terminal in insert mode
autocmd("TermOpen", {
  group = "custom",
  pattern = "*",
  command = "startinsert | set winfixheight",
})

-- start git messages in insert mode
autocmd("FileType", {
  group = "custom",
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1",
})

-- pager mappings for Manual
autocmd("FileType", {
  group = "custom",
  pattern = "man",
  callback = function()
    vim.keymap.set("n", "<enter>", "K", { buffer = true })
    vim.keymap.set("n", "<backspace>", "<c-o>", { buffer = true })
  end,
})
