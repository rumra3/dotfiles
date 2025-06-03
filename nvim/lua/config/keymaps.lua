vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<NOP>")
--TODO consider other keybinds
vim.keymap.set("n", "<C-x>", function()
  -- no. of windows open > 1
  if vim.fn.winnr('$') > 1 then
    vim.cmd.quit()
  end
end)

-- center view on next search result/EOF
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "G", "Gzz")

-- maintain visual mode when changing indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- screen navigation with arrow keys
vim.keymap.set("n", "<Down>", "<C-e>")
vim.keymap.set("n", "<Up>", "<C-y>")
vim.keymap.set("n", "<Right>", "<C-d>")
vim.keymap.set("n", "<Left>", "<C-u>")

-- splits
vim.keymap.set("n", "\\", ':vsplit ')
vim.keymap.set("n", "-", ':split ')

vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")

-- save
vim.keymap.set({"n", "i", "v"}, "<C-s>", ":update<CR>")

-- toggle search highlight
vim.keymap.set("n", "<C-k>", function() vim.cmd.set("hls!") end)

-- copipe from system clipboard
vim.keymap.set({"v", "n"}, "<leader>y", '"+y')
vim.keymap.set("v", "<leader>Y", '"+yg_')
vim.keymap.set({"v", "n"}, "<leader>p", '"+p')
vim.keymap.set({"v", "n"}, "<leader>P", '"+P')

-- terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<M-[>", "<Esc>")
vim.keymap.set("t", "<M-Esc>", "<Esc>")

-- Explore
vim.keymap.set("n", "<leader>.", vim.cmd.Explore)
