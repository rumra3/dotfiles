vim.opt.termguicolors = true

local modules = {
	"lazy-init",
	"options",
	"keymap.vanilla",
	"keymap.plugins",
}

for _, mod in ipairs(modules) do
    require(mod)
end
