-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

local opt = vim.opt
-- local g = vim.g
--
-- g.mapleader = "\\"
-- g.maplocalleader = "\\"
--
-- opt.colorcolumn = "80"
opt.relativenumber = false
-- opt.ignorecase = false
-- opt.conceallevel = 0
opt.mouse = ""
-- opt.clipboard = "unnamed"
--
-- vim.opt.colorcolumn = "+1"
