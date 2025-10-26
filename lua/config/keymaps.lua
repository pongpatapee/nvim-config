-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- better escape
map("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Dedicated copy paste to and from clipboard so I don't have to use vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "clipboard paste" })
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "clipboard yank" })

-- allow for Ctrl + Backspace for deleting words
map("i", "<C-h>", "<C-w>", { noremap = true, silent = true }) -- Can't bind <C-BS> directly, this is the work around

map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>_", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

-- center page when C-d/C-u
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
