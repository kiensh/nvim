-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.cmd("au BufNewFile,BufRead *.dart set shiftwidth=2 tabstop=2 softtabstop=2")

vim.opt.autoindent = true
vim.opt.smartindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- cursor line
vim.opt.cursorline = false
-- vim.opt.guicursor = ""
-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
-- vim.opt.guicursor = "n-v-c:block-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor"
vim.cmd("au VimLeave * set guicursor=a:hor20-Cursor/lCursor-blinkon0")

-- appearance
-- vim.opt.termguicolors = true
-- vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 80
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
-- vim.opt.clipboard:append("unnamedplus")
-- vim.opt.clipboard:prepend("unnamed")
vim.opt.clipboard:append("unnamed")

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- add keywords
vim.opt.iskeyword:append("-")
vim.opt.isfname:append("@-@")

-- fold
vim.opt.foldenable = false -- auto folden
vim.opt.foldmethod = "indent" -- indent syntax

-- netrw
vim.g.netrw_bufsettings = "noma nomod nu nowrap ro nobl"
-- vim.g.netrw_keepdir=0 -- path error
-- vim.g.netrw_banner = 1
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 25
-- vim.g.netrw_browse_split = 1
-- vim.g.netrw_preview = 1
-- vim.g.netrw_altv = 0

-- highlight on yank
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })")

