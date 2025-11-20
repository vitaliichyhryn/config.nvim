local opt = vim.opt
local g = vim.g

-- Globals
g.mapleader = ' '
g.maplocalleader = ' '
g.have_nerd_font = false

-- Status column
opt.statuscolumn = '%C %=%{v:relnum?v:relnum:v:lnum} %s'
opt.foldcolumn = '1'      -- display fold column
opt.signcolumn = 'yes'    -- display sign column
opt.number = true         -- display number column
opt.relativenumber = true -- make number relative

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 0
opt.expandtab = true
opt.smartindent = true

-- Indent wrapped lines
opt.breakindent = true

-- Render whitespace characters
opt.list = true
opt.listchars = { tab = '> ', trail = '·', nbsp = '_' }

-- Highlight line under cursor
opt.cursorline = true

-- Pad cursor
opt.scrolloff = 8

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Ask to save the file
opt.confirm = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Substitution preview
opt.inccommand = 'split'

-- Shared clipboard
opt.clipboard = 'unnamedplus'

-- Modelines
opt.modeline = false
