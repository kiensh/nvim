local list_lsp = {
    -- configure lua server (with special settings)
    lua_ls = {
        settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.stdpath('config') .. '/lua'] = true,
                    },
                },
            },
        },
    },

    -- configure html server
    html = {},

    -- configure typescript server with plugin
    tsserver = {},

    -- configure css server
    cssls = {},

    -- configure tailwindcss server
    tailwindcss = {},

    -- configure graphql language server
    graphql = {
        filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
    },

    -- configure emmet language server
    emmet_ls = {
        filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    },

    -- configure jsonls server
    jsonls = {},

    -- configure angularls server
    angularls = {},

    -- configure python server
    pyright = {
        settings = {
            python = {
                analysis = {
                    autoImportCompletions = true,
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'openFilesOnly',
                    pythonPath = vim.fn.exepath('python3'),
                    venvPath = '/home/uit/miniconda3/envs',
                },
            },
        },
    },

    -- configure omnisharp_mono server ----------- omnisharp_mono only for window
    -- configure omnisharp server
    omnisharp = {
        cmd = { 'dotnet', vim.fn.stdpath('data') .. '/mason/packages/omnisharp/libexec/OmniSharp.dll' },
        enable_editorconfig_support = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        enable_ms_build_load_projects_on_demand = false,
        handlers = {
            ['textDocument/definition'] = require('omnisharp_extended').handler,
        },
    },

    docker_compose_language_service = {},
    dockerls = {},
}

local list_exclude = {
    -- 'html',
    -- 'tsserver',
    -- 'cssls',
    -- 'tailwindcss',
    'graphql',
    'emmet_ls',
    -- 'jsonls',
    'angularls',
    -- 'pyright',
    -- 'omnisharp',
    -- 'docker_compose_language_service',
    -- 'dockerls',
}
for _, v in pairs(list_exclude) do
    list_lsp[v] = nil
end

return list_lsp
