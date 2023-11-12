-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- nmap <tab> :b#<cr>
-- " cycle through tabs with shift-tab
-- nmap <S-tab> :bn<cr>

local map = vim.keymap.set

map("n", "<tab>", "<cmd>b#<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bn<cr>", { desc = "Next buffer" })

-- Keep cursor at the bottom of the visual selection after you yank it.
map("v", "y", "ygv<Esc>", { desc = "Yank visual selection" })
