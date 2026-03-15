-- Global and runtime options/config for neovim working. Copied from https://github.com/radleylewis/nvim-lite

-- mapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- cursor and other things
vim.opt.number = true -- allow numbered rows
vim.opt.relativenumber = true -- allow relative numbering
vim.opt.cursorline = true -- highlight cursor line
vim.opt.wrap = false -- line wrapping
vim.opt.scrolloff = 5 -- line offset from the cursor (top/bottom)
vim.opt.sidescrolloff = 5 -- line offset from the cursor (left/right)

-- indentation
vim.opt.tabstop = 4 -- tab width
vim.opt.shiftwidth = 4 -- indent width
vim.opt.softtabstop = 4
vim.opt.expandtab = true -- spaces instead of tabs
vim.opt.smartindent = true -- detect indent for auto-indenting
vim.opt.autoindent = true -- copy indent from current line

-- searching
vim.opt.smartcase = true -- case sensitive
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.hlsearch = true -- searching highlight
vim.opt.incsearch = true -- show matchings

-- visuals
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true -- highlight matching brackets
vim.opt.cmdheight = 1 -- command line height
vim.opt.showmode = true -- mode display in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300

-- file handling
vim.opt.backup = false -- backup files
vim.opt.writebackup = false -- backup files before writing
vim.opt.swapfile = false
vim.opt.undofile = true -- persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 750 -- key timeout duration
vim.opt.autoread = true -- auto reload files changed outside vim
vim.opt.autowrite = false -- auto saving

-- splitting
vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

-- others
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "ident,eol,start"
vim.opt.autochdir = false
vim.opt.path:append("**")
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "utf-8"
