return {
  {
    "willothy/flatten.nvim",
    config = {
      window = {
        open = "vsplit",
      },
    },
    -- or pass configuration with
    -- opts = {  }
    -- Ensure that it runs first to minimize delay when opening file from terminal
    lazy = false,
    priority = 1001,
  },
  --- ...
}
