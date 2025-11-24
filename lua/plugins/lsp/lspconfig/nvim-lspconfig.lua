vim.diagnostic.config({
    float = {
        border = "rounded",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = "󰋼 ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
    },
})

return {
    "neovim/nvim-lspconfig",
    event = { "BufWinEnter", "BufReadPre", "BufNewFile" },
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason-lspconfig.nvim",
        LIST_LSPCONFIG["omnisharp"] and "Hoffs/omnisharp-extended-lsp.nvim" or nil,
    },
    config = function()
        require("lspconfig.ui.windows").default_options.border = "double"

        vim.lsp.config("*", {
            on_attach = require("plugins.lsp.lspconfig.on_attach"),
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        for k, v in pairs(LIST_LSPCONFIG) do
            v.on_attach = require("plugins.lsp.lspconfig.on_attach")
            vim.lsp.config(k, v)
            if k == "dartls" then
                require("lspconfig").dartls.setup(v)
            end
        end
    end,
}
