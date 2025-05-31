return {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "super-tab",
            ["<C-n>"] = { "show", "select_next" },
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        },

        cmdline = {
            keymap = {
                ["<C-n>"] = { "show", "select_next" },
            },
        },

        completion = {
            trigger = { show_on_keyword = true },

            menu = {
                auto_show = true,
                border = "rounded",
                scrollbar = false,
                draw = {
                    columns = {
                        { "kind_icon", "kind" },
                        { "label", "label_description", gap = 1 },
                    },
                },
            },

            documentation = {
                auto_show = true,
                window = {
                    border = "rounded",
                    scrollbar = false,
                },
            },
        },

        sources = { default = { "lsp", "path", "snippets", "buffer" } },

        fuzzy = { implementation = "lua" },
    },
}
