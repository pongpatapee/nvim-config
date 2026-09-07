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
map("i", "<C-BS>", "<C-w>", { noremap = true, silent = true }) -- Ghostty kitty protocol sends <C-BS>

map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>_", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

-- center page when C-d/C-u
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

-- Comments
-- <C-_> is Ctrl + /
map("n", "<C-_>", "gcc", { remap = true })
map("v", "<C-_>", "gc", { remap = true })
map("i", "<C-_>", function()
  local curr_win = vim.api.nvim_get_current_win()
  local cursor_pos = vim.api.nvim_win_get_cursor(curr_win)
  local line = cursor_pos[1]
  require("mini.comment").toggle_lines(line, line)
end, { remap = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Normal mode: Delete single item
    vim.keymap.set("n", "dd", function()
      local qf_list = vim.fn.getqflist()
      local idx = vim.fn.line(".")
      table.remove(qf_list, idx)
      vim.fn.setqflist(qf_list, "r")
      vim.fn.cursor(math.min(idx, #qf_list), 1)
    end, { buffer = true, desc = "Delete item from quickfix list" })

    -- Visual mode: Delete highlighted items
    vim.keymap.set("v", "d", function()
      local qf_list = vim.fn.getqflist()
      local first_line = vim.fn.line("v")
      local last_line = vim.fn.line(".")

      -- Ensure correct order if highlighted bottom-to-top
      local start_idx = math.min(first_line, last_line)
      local end_idx = math.max(first_line, last_line)

      -- Remove items backwards to keep indexes intact
      for i = end_idx, start_idx, -1 do
        table.remove(qf_list, i)
      end

      vim.fn.setqflist(qf_list, "r")
      vim.fn.cursor(math.min(start_idx, #qf_list), 1)
    end, { buffer = true, desc = "Delete selected items from quickfix list" })
  end,
})
