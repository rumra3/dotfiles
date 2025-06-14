local config = function(_, _) -- second arg would be `opts`
	local lsp = require "lspconfig"
	lsp.clangd.setup{}
	lsp.hls.setup{
		filetypes = { 'haskell', 'lhaskell', 'cabal' },
	}
	lsp.metals.setup{}
	lsp.rust_analyzer.setup{}
  lsp.jedi_language_server.setup{}
  lsp.zls.setup{}
  lsp.jdtls.setup{
    cmd = { '/opt/jdtls/bin/jdtls' },
  }
  vim.g.zig_fmt_autosave = 0
  lsp.lua_ls.setup {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT'
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        }
      })
    end,
    settings = {
      Lua = {}
    }
  }
  lsp.texlab.setup{}

  local luasnip = require "luasnip"
  -- nvim-cmp setup
  local cmp = require "cmp"
  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = vim.NIL,
      ["<Tab>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, {"i", "s"}),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {"i", "s"})
    }),
    formatting = {
      format = function(entry, vim_item)
        local function trim(text)
          local max = 40
          if text and text:len() > max then
            text = text:sub(1,max) .. "..."
          end
          return text
        end

				vim_item.abbr = trim(vim_item.abbr)
				return vim_item
			end,
		},
		sources = {{
			name = "nvim_lsp"
		}, {
			name = "luasnip"
		}, {
			name = "path"
		}, {
			name = "buffer",
			option = {
				-- Avoid accidentally running on big files
				get_bufnrs = function()
					local buf = vim.api.nvim_get_current_buf()
					local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
					if byte_size > 1024 * 1024 then -- 1 Megabyte max
						return {}
					end
					return {buf}
				end
			}
		}}
	}
end

return {
	{
		"neovim/nvim-lspconfig",
		event = {"BufReadPre", "BufNewFile"},
		lazy = true,
		dependencies = {
			{
				"hrsh7th/nvim-cmp",
				dependencies = { "L3MON4D3/LuaSnip", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer","saadparwaiz1/cmp_luasnip" },
			}
		},
		opts = {
			autoformat = true,
			servers = {
				clangd = {},
				metals = {},
			},
			setup = {},
		},
		config = config,
	}
}
