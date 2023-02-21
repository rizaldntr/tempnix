local button = require("alpha.themes.dashboard").button
require('alpha').setup({
  layout = {
    { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
    {
      type = "text",
      val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      },
      opts = { position = "center", hl = "DashboardHeader" },
    },
    { type = "padding", val = 5 },
    {
      type = "group",
      val = {
        button("LDR f f", "  Find File  "),
        button("LDR f o", "  Recents  "),
        button("LDR f w", "  Find Word  "),
        button("LDR f n", "  New File  "),
        button("LDR f m", "  Bookmarks  "),
        button("LDR S l", "  Last Session  "),
      },
      opts = { spacing = 1 },
    },
  },
})

