vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = false

vim.opt.list = true
vim.opt.listchars = "tab:| ,trail:·,multispace:·,nbsp:~,leadmultispace:·   "

vim.opt.smartindent = false
vim.opt.cindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"

vim.opt.splitright = true

vim.opt.guicursor = "n-v-c-i:block"

local statusline = {
  '%f',         -- file name tail
  '%r',         -- readonly
  ' %m',        -- modified
  '%=',         -- separate alignments
  '%{&filetype}',
  ' %2p%%',     -- percentage
  ' %3l:%-2c',  -- line:col
}
vim.opt.statusline = table.concat(statusline, '')
