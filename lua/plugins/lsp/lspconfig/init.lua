LIST_LSPCONFIG = {
    lua_ls = {
        enabled = true,
        settings = { -- custom settings for lua
            Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    },
    jsonls = { enabled = true },
    bashls = {
        enabled = MY_OS.isMac() or MY_OS.isLinux(),
        settings = {
            bashIde = {
                globPattern = "*@(.sh|.inc|.bash|.command)",
            },
        },
    },
    powershell_es = { enabled = MY_OS.isWindows() },

    html = {
        enabled = false,
        filetypes = { "html", "typescriptreact", "javascriptreact" },
    },
    tsserver = { enabled = false },
    cssls = { enabled = false },

    tailwindcss = { enabled = false },
    eslint = { enabled = false },
    graphql = {
        enabled = false,
        filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    },
    emmet_ls = {
        enabled = false,
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    },
    angularls = { enabled = true },

    pyright = {
        enabled = false,
        settings = {
            python = {
                analysis = {
                    autoImportCompletions = true,
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "openFilesOnly",
                    pythonPath = vim.fn.exepath("python3"),
                    venvPath = "/home/uit/miniconda3/envs",
                },
            },
        },
    },

    omnisharp = {
        enabled = true,
        cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
        enable_editorconfig_support = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        enable_ms_build_load_projects_on_demand = false,
        handlers = {
            ["textDocument/definition"] = function() return require("omnisharp_extended").definition_handler end,
            ["textDocument/typeDefinition"] = function() return require('omnisharp_extended').type_definition_handler end,
            ["textDocument/references"] = function() return require('omnisharp_extended').references_handler end,
            ["textDocument/implementation"] = function() return require('omnisharp_extended').implementation_handler end,
        },
    },

    dartls = {
        enabled = false,
        init_options = {
            onlyAnalyzeProjectsWithOpenFiles = false,
            suggestFromUnimportedLibraries = true,
            closingLabels = true,
            outline = false,
            flutterOutline = false,
        },
        settings = {
            dart = {
                analysisExcludedFolders = {
                    vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
                    vim.fn.expand("$HOME/.pub-cache"),
                    vim.fn.expand("/opt/homebrew/"),
                    vim.fn.expand("$HOME/tools/flutter/"),
                },
                updateImportsOnRename = true,
                completeFunctionCalls = true,
                showTodos = true,
            },
        },
    },

}

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufReadPost" }, {
    pattern = {
        "*.dart",
        "*.js",
        "*.jsx",
        "*.ts",
        "*.tsx",
    },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
    end,
})

for k, v in pairs(LIST_LSPCONFIG) do
    if not v.enabled then
        LIST_LSPCONFIG[k] = nil
    end
end

return {
    require("plugins.lsp.lspconfig.nvim-lspconfig"),
    require("plugins.lsp.lspconfig.mason-lspconfig"),
}
