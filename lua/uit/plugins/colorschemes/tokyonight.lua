return {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 1000,
  opts = {
    transparent = true,
    style = "moon", -- "day", "night" or "moon"
    styles = {
      comments = { italic = true },
      keywords = { italic = true },

      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent", -- style for floating windows
    },
  },
}
