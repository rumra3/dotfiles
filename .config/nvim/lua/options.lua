vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.expandtab = false

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

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

-- insert newline when appending to registers
vim.o.cpoptions = vim.o.cpoptions .. '>'

-- clear registers
local registers = 'qwertyuiopasdfghjklzxcvbnm'
for r in registers:gmatch('.') do
	vim.fn.setreg(r, '')
end

vim.o.shell = "/bin/bash"

