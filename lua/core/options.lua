-- workaround for Windows
-- basic settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.swapfile = false
vim.o.winborder = "rounded"

-- indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- visual
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.showmatch = true
vim.o.cmdheight = 1
vim.o.pumheight = 10
vim.o.pumblend = 10
vim.o.winblend = 0
vim.o.conceallevel = 0
vim.o.concealcursor = ""
vim.o.lazyredraw = true
vim.o.synmaxcol = 300

-- file handling
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 0
vim.o.autoread = true
vim.o.autowrite = false

-- behavior
vim.o.hidden = true
vim.o.errorbells = false
vim.o.backspace = "indent,eol,start"
vim.o.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.o.mouse = "a"
--vim.opt.clipboard:append("unnamedplus")
vim.o.modifiable = true
vim.o.encoding = "UTF-8"
vim.g.mapleader = " "

-- wild menu
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.pyc", "*.class", "*.jar", "*.obj" })

-- performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end
