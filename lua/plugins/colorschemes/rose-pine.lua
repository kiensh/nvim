-- default variant is "main"
-- vim.g.rose_pine_variant = "moon"

return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
    opts = {
        --- @usage "auto"|"main"|"moon"|"dawn"
        variant = "auto",
        --- @usage "main"|"moon"|"dawn"
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = false,

        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
            background = "Normal",
            background_nc = "_experimental_nc",
            panel = "surface",
            -- panel = "Normal",
            panel_nc = "base_nc",
            border = "rose",
            comment = "muted",
            link = "iris",
            punctuation = "subtle",

            error = "love",
            hint = "iris",
            info = "foam",
            warn = "gold",

            headings = {
                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },
            -- or set all headings at once
            -- headings = "subtle"
        },

        -- Change specific vim highlight groups
        -- https://github.com/rose-pine/neovim/wiki/Recipes
        highlight_groups = {
            -- ColorColumn = { bg = "foam", blend = 0 },

            -- Blend colours against the "base" background
            StatusLine = { fg = "love", bg = "rose", blend = 20 },
            StatusLineNC = { fg = "subtle", bg = "none" },
            FloatTitle = { fg = "rose", bg = "none" },

            -- Telescope
            -- TelescopeSelection = { fg = "love", bg = "none" },
            -- TelescopeNormal = { bg = "none" },
            -- TelescopeBorder = { fg = "love", bg = "none" },
            -- TelescopeTitle = { fg = "love", bg = "none" },
            -- TelescopePromptTitle = { fg = "love", bg = "none" },
            -- TelescopeResultsTitle = { fg = "love", bg = "none" },
            -- TelescopePreviewTitle = { fg = "love", bg = "none" },
            -- TelescopeResultsNormal = { fg = "subtle", bg = "none" },
            -- TelescopeSelectionCaret = { fg = "love", bg = "none" },

            -- NvimTree
            -- NvimTreeNormal = { bg = "none" },
            NvimTreeIndentMarker = { fg = "rose" },

            -- By default each group adds to the existing config.
            -- If you only want to set what is written in this config exactly,
            -- you can set the inherit option:
            Search = { fg = "base", bg = "rose" },
            CurSearch = { fg = "base", bg = "rose", inherit = false },

            -- Trouble
            TroubleNormal = { fg = "text", bg = "none" },
        },
    },
}

-- local variants = {
-- 	main = {
-- 		---@deprecated for backwards compatibility
-- 		_experimental_nc = "#16141f",
-- 		nc = "#16141f",
-- 		base = "#191724",
-- 		surface = "#1f1d2e",
-- 		overlay = "#26233a",
-- 		muted = "#6e6a86",
-- 		subtle = "#908caa",
-- 		text = "#e0def4",
-- 		love = "#eb6f92",
-- 		gold = "#f6c177",
-- 		rose = "#ebbcba",
-- 		pine = "#31748f",
-- 		foam = "#9ccfd8",
-- 		iris = "#c4a7e7",
-- 		highlight_low = "#21202e",
-- 		highlight_med = "#403d52",
-- 		highlight_high = "#524f67",
-- 		none = "NONE",
-- 	},
-- 	moon = {
-- 		---@deprecated for backwards compatibility
-- 		_experimental_nc = "#1f1d30",
-- 		nc = "#1f1d30",
-- 		base = "#232136",
-- 		surface = "#2a273f",
-- 		overlay = "#393552",
-- 		muted = "#6e6a86",
-- 		subtle = "#908caa",
-- 		text = "#e0def4",
-- 		love = "#eb6f92",
-- 		gold = "#f6c177",
-- 		rose = "#ea9a97",
-- 		pine = "#3e8fb0",
-- 		foam = "#9ccfd8",
-- 		iris = "#c4a7e7",
-- 		highlight_low = "#2a283e",
-- 		highlight_med = "#44415a",
-- 		highlight_high = "#56526e",
-- 		none = "NONE",
-- 	},
-- 	dawn = {
-- 		---@deprecated for backwards compatibility
-- 		_experimental_nc = "#f8f0e7",
-- 		nc = "#f8f0e7",
-- 		base = "#faf4ed",
-- 		surface = "#fffaf3",
-- 		overlay = "#f2e9e1",
-- 		muted = "#9893a5",
-- 		subtle = "#797593",
-- 		text = "#575279",
-- 		love = "#b4637a",
-- 		gold = "#ea9d34",
-- 		rose = "#d7827e",
-- 		pine = "#286983",
-- 		foam = "#56949f",
-- 		iris = "#907aa9",
-- 		highlight_low = "#f4ede8",
-- 		highlight_med = "#dfdad9",
-- 		highlight_high = "#cecacd",
-- 		none = "NONE",
-- 	},
-- }
