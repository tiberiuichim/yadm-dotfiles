-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- " cycle through tabs with shift-tab
map("n", "<tab>", "<cmd>b#<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bn<cr>", { desc = "Next buffer" })

-- Keep cursor at the bottom of the visual selection after you yank it.
map("v", "y", "ygv<Esc>", { desc = "Yank visual selection" })

map("n", "<S-Right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to right" })
map("n", "<S-Left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to left" })

map("n", "<space>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "<space>q", vim.diagnostic.setloclist)
