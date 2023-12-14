-- Options are automatically loaded before lazy.nvim startup
-- Default options _mochathat are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- To temporarily disable the mouse, hold down shift key
-- vim.opt.mouse = ''

local opt = vim.opt
local g = vim.g

g.mapleader = "\\"
g.maplocalleader = "\\"

opt.colorcolumn = "80"
opt.relativenumber = false
opt.ignorecase = false
opt.conceallevel = 0

-- vim.opt.colorcolumn = "+1"
