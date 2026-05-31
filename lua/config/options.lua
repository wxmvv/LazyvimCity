-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.snacks_animate = true
vim.g.autoformat = false -- format on save
-- vim.g.trouble_lualine = false

local opt = vim.opt

vim.opt.scrolloff = 0

opt.signcolumn = "no"
opt.foldcolumn = "0"
opt.numberwidth = 2
opt.statuscolumn = ""

opt.mouse = ""

opt.cursorline = true

opt.spell = false
opt.spelllang = {}
opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.autoindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.conceallevel = 0

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- tokeynigth
opt.termguicolors = true
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard = ""

-- split windows
opt.splitright = true
opt.splitbelow = true

-- homepage
vim.api.nvim_create_user_command("Home", function()
  Snacks.dashboard()
end, { desc = "Open Snacks dashboard" })
