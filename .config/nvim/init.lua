-- Clone 'mini.deps' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.deps'
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.deps`" | redraw')
	local clone_cmd = {
		'git', 'clone', '--filter=blob:none',
		'https://github.com/echasnovski/mini.deps', mini_path
	}
	vim.fn.system(clone_cmd)
	vim.cmd('packadd mini.deps | helptags ALL')
	vim.cmd('echo "Installed `mini.deps`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

local modules = {
	'options',
	'keymaps',
	'plugins',
}

for _, mod in ipairs(modules) do
	require(mod)
end
