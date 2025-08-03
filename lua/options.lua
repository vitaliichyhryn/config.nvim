-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd font
vim.g.have_nerd_font = false

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Indent wrapped lines
vim.opt.breakindent = true

-- Render whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '> ', trail = '·', nbsp = '␣' }

-- Always draw signcolumn
vim.opt.signcolumn = 'yes'

-- Highlight line under cursor
vim.opt.cursorline = true

-- Pad cursor
vim.opt.scrolloff = 8

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Ask to save the file
vim.opt.confirm = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Substitution preview
vim.opt.inccommand = 'split'

-- Shared clipboard
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)
