return {
    'nvimtools/none-ls.nvim', -- configure formatters & linters
    cond = false,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'jayp0521/mason-null-ls.nvim',
    },
    opts = function()
        -- import null-ls plugin
        local null_ls = require('null-ls')
        local null_ls_utils = require('null-ls.utils')

        -- for conciseness
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        return {
            -- add package.json as identifier for root (for typescript monorepos)
            root_dir = null_ls_utils.root_pattern('.null-ls-root', 'Makefile', '.git', 'package.json'),
            -- setup formatters & linters
            sources = {
                --  to disable file types use
                --  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
                formatting.prettier.with({ extra_filetypes = { 'svelte' } }), -- js/ts formatter
                formatting.stylua, -- lua formatter
                formatting.csharpier,
                formatting.black,

                -- diagnostics
                diagnostics.eslint_d.with({ -- js/ts linter
                    condition = function(utils)
                        return utils.root_has_file({ '.eslintrc.js', '.eslintrc.cjs' }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
                    end,
                }),
                -- diagnostics.mypy,
                diagnostics.ruff,
            },
            -- configure format on save
            -- on_attach = on_attach,
        }
    end,
    keys = {
        { '<leader>fm', require('uit.plugins.lsp.none-ls.on_format') },
    },
}
