vim.opt.termguicolors = true

local modules = { 
    "config.lazy",
    "config.options", 
    "config.keymaps", 
}

for _, mod in ipairs(modules) do
    require(mod)
end
