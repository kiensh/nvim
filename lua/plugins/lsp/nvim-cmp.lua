local function convertSources(sources)
    local result = {}
    for _, v in ipairs(sources) do
        if type(v) == 'string' then
            table.insert(result, { name = v, max_item_count = 20 })
        elseif type(v) == 'table' then
            table.insert(result, v)
        end
    end
    return result
end

return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {   --- @sources
            'hrsh7th/cmp-buffer',
            'FelipeLema/cmp-async-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
        },
        {   --- @snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
        'onsails/lspkind.nvim',
    },
    config = function(_, _)
        local cmp = require('cmp')

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            completion = {
                -- autocomplete = true,
                completeopt = 'menu,menuone,preview,noselect',
                keyword_length = 2,
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
                ['<C-u>'] = cmp.mapping.scroll_docs(-5),
                ['<C-d>'] = cmp.mapping.scroll_docs(5),
                ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
                -- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
            }),
            sources = cmp.config.sources(convertSources({
                'copilot',
                'nvim_lsp',
                'buffer',
                'async_path',
                'path',
                'luasnip',
                'neorg',
            })),
            formatting = {
                format = require('lspkind').cmp_format({
                    maxwidth = 50,
                    ellipsis_char = '...',
                    mode = 'symbol_text',
                    menu = {
                        buffer = '[Buffer]',
                        nvim_lsp = '[LSP]',
                        luasnip = '[LuaSnip]',
                        async_path = '[Path]',
                        path = '[Path]',
                        -- copilot = "[Copilot]",
                        neorg = '[Neorg]',
                        cmdline = '[Cmd]',
                    },
                }),
                fields = { 'kind', 'abbr', 'menu' },
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
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(convertSources({
                'buffer',
            })),
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(convertSources({
                'cmdline',
                'async_path',
            })),
        })
    end,
}
