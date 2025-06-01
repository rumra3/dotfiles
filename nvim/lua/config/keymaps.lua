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

-- lsp
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end)
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- nvim-surround
require('nvim-surround').setup({
	keymaps = {
		normal      = 'gz',
		normal_cur    = 'gZ',
		normal_line   = 'gzgz',
		normal_cur_line = 'gZgZ',
		visual      = 'gz',
		visual_line   = 'gZ',
		delete      = 'gzd',
		change      = 'gzc',
	}
})
