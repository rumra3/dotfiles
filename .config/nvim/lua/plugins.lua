local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- colorscheme
now(function()
	add({ source = 'morhetz/gruvbox' })
	vim.o.background = 'light'
	vim.cmd.colorscheme('gruvbox')
end)

-- nvim-treesitter
later(function()
	add({
		source = 'nvim-treesitter/nvim-treesitter',
		checkout = 'master',
		monitor = 'main',
		hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
	})
	require('nvim-treesitter.configs').setup({
		ensure_installed = { 'vimdoc', 'lua', 'c', 'cpp', 'typst', },
		highlight = { enable = true },
	})
end)

-- surround
now(function()
	add({ source = 'kylechui/nvim-surround' })
	require('nvim-surround').setup({
		keymaps = {
			normal = 's',
			normal_line = 'S',
			visual = 's',
			visual_line = 'S',
			delete = 'ds',
			change = 'cs',
			change_line = 'cS',
		}
	})
end)

-- telescope
later(function()
	add({
		source = 'nvim-telescope/telescope.nvim',
		depends = { 'nvim-lua/plenary.nvim' },
	})
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>f', builtin.find_files,
		{ desc = 'Telescope find files' })
	vim.keymap.set('n', '<leader>g', builtin.live_grep,
		{ desc = 'Telescope live grep' })
	vim.keymap.set('n', '<leader>b', builtin.buffers,
		{ desc = 'Telescope buffers' })
	vim.keymap.set('n', '<leader>h', builtin.help_tags,
		{ desc = 'Telescope help tags' })
end)

-- cmp
later(function()
	add({
		source = 'hrsh7th/nvim-cmp',
		depends = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
		}
	})
	local cmp = require('cmp')
	cmp.setup({
		snippet = {
			expand = function(args)
				vim.snippet.expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<CR>'] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = 'buffer' },
			{ name = 'path' },
		}),
	})
	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'buffer' }
		}
	})
	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' }
		}, {
			{ name = 'cmdline' }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	})
end)
