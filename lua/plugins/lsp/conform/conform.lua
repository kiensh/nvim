return {
    "stevearc/conform.nvim",
    dependencies = { "zapling/mason-conform.nvim" },
    keys = {
        {
            KEYS.leader.f.m,
            function()
                require("conform").format({
                    lsp_fallback = true,
                    async = true,
                    timeout_ms = 1000,
                })
            end,
            mode = { "n", "v" },
            desc = "Format file or range (in visual mode)",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },

            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },

            -- cs = { "csharpier" },

            tex = { "latexindent" },
            bib = { "bibtex-tidy" },

            sh = { "shfmt" },
            bash = { "shfmt" },
            zsh = { "shfmt" },
        },
        formatters = {
            latexindent = {
                args = { "-y=defaultIndent: '  '" },
            },
        },
    },
}
