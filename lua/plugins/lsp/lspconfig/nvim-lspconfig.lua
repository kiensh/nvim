local codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = {
                "",
                "quickfix",
                "refactor",
                "refactor.extract",
                "refactor.inline",
                "refactor.rewrite",
                "source",
                "source.organizeImports",
            },
        },
    },
}

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
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        LIST_LSPCONFIG["omnisharp"] and "Hoffs/omnisharp-extended-lsp.nvim" or nil,
    },
    config = function()
        local lspconfig = require("lspconfig")
        require("lspconfig.ui.windows").default_options.border = "double"
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.textDocument.codeAction = codeAction
        lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
            on_attach = require("plugins.lsp.lspconfig.on_attach"),
            capabilities = capabilities,
        })

        for k, v in pairs(LIST_LSPCONFIG) do
            lspconfig[k].setup(v)
        end
    end,
}
