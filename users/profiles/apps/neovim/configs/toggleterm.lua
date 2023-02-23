require("toggleterm").setup({
  size = 10,
  open_mapping = [[<F7>]],
  -- shading_factor = 5,
  shade_terminals = false,
  direction = "float",
  highlights = {
    Normal = {
      guibg = colors.backgroundDarker,
    },
  },
  float_opts = {
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

