return {
    "jayp0521/mason-null-ls.nvim",
    lazy = true,
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    opts = {
        ensure_installed = {
            "stylua",
            -- "prettier",
            -- "eslint_d",
            -- "csharpier",
        },
        methods = {
            diagnostics = true,
            formatting = true,
            code_actions = true,
            completion = true,
            hover = true,
        },
        automatic_installation = true,
    },
}
