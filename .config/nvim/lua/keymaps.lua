vim.g.mapleader = ' '
vim.keymap.set('n', '<Space>', '<NOP>')

-- unset these
vim.keymap.set({'n', 'v'}, 'x', '')
vim.keymap.set('n', 's', '')

-- center view on next search result/EOF
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', 'G', 'Gzz')

-- search & replace in visual mode
vim.keymap.set('v', 's', ':s/')

-- goto end of file
vim.keymap.set('n', 'ge', 'Gzz')

-- insert line without moving
vim.keymap.set('n', '<M-o>',
	':call append(getpos(".")[1], [\"\"])<cr>',
	{ silent = true })
vim.keymap.set('n', '<M-O>',
	':call append(getpos(".")[1]-1, [\"\"])<cr>',
	{ silent = true })

-- maintain visual mode when changing indent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- screen navigation with arrow keys
vim.keymap.set('n', '<Down>', '<C-e>')
vim.keymap.set('n', '<Up>', '<C-y>')
vim.keymap.set('n', '<Right>', '<C-d>')
vim.keymap.set('n', '<Left>', '<C-u>')

-- splits
vim.keymap.set('n', '\\', ':vsplit ')
vim.keymap.set('n', '-', ':split ')

-- navigate splits
vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-l>', '<C-w>l')

-- navigate tabs
vim.keymap.set('n', '<C-n>', vim.cmd.tabedit)
vim.keymap.set('n', '<C-t>', ':tabe ')

-- navigate tabs
vim.keymap.set('n', '<M-L>', vim.cmd.tabnext)
vim.keymap.set('n', '<M-H>', vim.cmd.tabprevious)

-- save
vim.keymap.set({'n', 'i', 'v'}, '<C-s>', ':update<CR>')

-- toggle search highlight
vim.keymap.set('n', '<C-k>', function() vim.cmd.set('hls!') end)

-- copipe from system clipboard
vim.keymap.set({'v', 'n'}, '<leader>y', '"+y')
vim.keymap.set('v', '<leader>Y', '"+yg_')
vim.keymap.set({'v', 'n'}, '<leader>p', '"+p')
vim.keymap.set({'v', 'n'}, '<leader>P', '"+P')

-- terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<M-[>', '<Esc>')
vim.keymap.set('t', '<M-Esc>', '<Esc>')

-- Explore
vim.keymap.set('n', '<leader>.', vim.cmd.Explore)
