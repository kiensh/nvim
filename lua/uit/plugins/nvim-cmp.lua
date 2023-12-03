return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-buffer', -- source for text in buffer
        'hrsh7th/cmp-path', -- source for file system paths
        'L3MON4D3/LuaSnip', -- snippet engine
        'saadparwaiz1/cmp_luasnip', -- for autocompletion
        'rafamadriz/friendly-snippets', -- useful snippets
        'onsails/lspkind.nvim', -- vs-code like pictograms
        -- "zbirenbaum/copilot-cmp",
    },
    opts = function()
        local cmp = require('cmp')

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require('luasnip.loaders.from_vscode').lazy_load()

        return {
            completion = {
                -- autocomplete = true,
                completeopt = 'menu,menuone,preview,noselect',
                keyword_length = 3,
            },
            performance = {
                max_view_entries = 100,
            },
            window = {
                completion = cmp.config.window.bordered({
                    winhighlight = 'Normal:Normal,BorderFloat:BorderBG,CursorLine:PmenuSel,Search:None',
                }),
                documentation = cmp.config.window.bordered({
                    winhighlight = 'Normal:Normal,BorderFloat:BorderBG,CursorLine:PmenuSel,Search:None',
                }),
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
                -- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = 'buffer', max_item_count = 20 }, -- text within current buffer
                { name = 'path', max_item_count = 20 }, -- file system paths
                { name = 'nvim_lsp', max_item_count = 20 },
                -- { name = 'copilot', max_item_count = 20 },
                { name = 'luasnip', max_item_count = 20 }, -- snippets
            }),
            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                format = require('lspkind').cmp_format({
                    maxwidth = 50,
                    ellipsis_char = '...',
                    mode = 'symbol_text',
                    menu = {
                        buffer = '[Buffer]',
                        nvim_lsp = '[LSP]',
                        luasnip = '[LuaSnip]',
                        path = '[Path]',
                        -- copilot = "[Copilot]",
                    },
                }),
                fields = { 'kind', 'abbr', 'menu', },
                -- fields = { 'abbr', 'kind', 'menu' },
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    -- require("copilot_cmp.comparators").prioritize,

                    -- Below is the default comparitor list and order for nvim-cmp
                    cmp.config.compare.offset,
                    -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        }
    end,
}
