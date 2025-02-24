vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ov", vim.cmd.Ex)
vim.keymap.set("n", "<Space>", "<NOP>")
--TODO consider other keybinds
vim.keymap.set("n", "<C-x>", function()
  if vim.fn.winnr('$') > 1 then
    vim.cmd.quit()
  end
end)

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "G", "Gzz")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "\\", ':vsplit ')
vim.keymap.set("n", "-", ':split ')

vim.keymap.set({"n", "i", "v"}, "<C-s>", ":update<CR>")

vim.keymap.set("n", "<C-k>", function() vim.cmd.set("hls!") end)

-- locallist & quickfix
local current_or_move = function(current)
  return function(move)
    return function()
      if not pcall(move) then
        pcall(current)
      end
    end
  end
end

--  locallist
local ll_or_next = current_or_move(vim.cmd.ll)
vim.keymap.set("n", "<C-Left>", ll_or_next(vim.cmd.lprev))
vim.keymap.set("n", "<C-Right>", ll_or_next(vim.cmd.lnext))
vim.keymap.set("n", "<C-Up>", function()
  vim.diagnostic.setloclist()
  pcall(vim.cmd.lopen)
end);
vim.keymap.set("n", "<C-Down>", function() pcall(vim.cmd.lclose) end);

--  quickfix
local cc_or_next = current_or_move(vim.cmd.cc)
vim.keymap.set("n", "<Left>", cc_or_next(vim.cmd.cprev))
vim.keymap.set("n", "<Right>", cc_or_next(vim.cmd.cnext))
vim.keymap.set("n", "<Up>", function()
  vim.diagnostic.setqflist()
  pcall(vim.cmd.copen)
end);
vim.keymap.set("n", "<Down>", function() pcall(vim.cmd.cclose) end);


-- copipe
vim.keymap.set({"v", "n"}, "<leader>y", '"+y')
vim.keymap.set("v", "<leader>Y", '"+yg_')
vim.keymap.set({"v", "n"}, "<leader>p", '"+p')
vim.keymap.set({"v", "n"}, "<leader>P", '"+P')

-- terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<M-[>", "<Esc>")
vim.keymap.set("t", "<M-Esc>", "<Esc>")

vim.keymap.set("t", "<M-h>", "<C-\\><C-n><cmd>TmuxNavigateLeft<cr>")
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><cmd>TmuxNavigateDown<cr>")
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><cmd>TmuxNavigateUp<cr>")
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><cmd>TmuxNavigateRight<cr>")

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>0", function() ui.nav_file(10) end)

-- lsp
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end)
vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end)
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end)
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

-- oil
local oil_last_buf = nil
local toggle_oil = function(dir)
  if vim.bo.filetype == "oil" then
    if oil_last_buf ~= nil then
      vim.cmd.buffer(oil_last_buf)
    end
  else
    oil_last_buf = vim.api.nvim_get_current_buf()
    vim.cmd.edit(dir)
  end
end

vim.keymap.set("n", "<leader>/", function() toggle_oil(".") end)
vim.keymap.set("n", "<leader>.", function()
  local path = vim.fn.expand('%')
  local i = path:reverse():find('/', 1, true)
  if i == nil then
    -- no '/' -> we are in $CWD already
    toggle_oil(".")
  else
    local dir = path:sub(0, -i)
    toggle_oil(dir)
  end
end)

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
