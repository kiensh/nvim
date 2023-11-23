return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    enabled = true,
    indent = {
        char = "|",
        highlight = "NonText",
    },
    -- whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = {
      enabled = true,
      char = "┃",
      show_start = false,
      highlight = "FloatBorder",
    },
  },
}
