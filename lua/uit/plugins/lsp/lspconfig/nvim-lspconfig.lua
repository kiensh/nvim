return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        { 'antosha417/nvim-lsp-file-operations', config = true },
        'williamboman/mason-lspconfig.nvim',
        'Hoffs/omnisharp-extended-lsp.nvim',
        'stevearc/dressing.nvim',
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require('lspconfig')
        -- local util = require("lspconfig.util")
        require("lspconfig.ui.windows").default_options.border = "double"

        lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
            on_attach = require('uit.plugins.lsp.lspconfig.on_attach'),
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        })

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
        for type, icon in pairs(signs) do
            local hl = 'diagnosticsign' .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
        end

        local list_lsp = require('uit.plugins.lsp.lspconfig.list-lsp')

        for k, v in pairs(list_lsp) do
            lspconfig[k].setup(v)
        end
    end,
}
