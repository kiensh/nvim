return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { KEYS.leader.f.m, require("plugins.lsp.none-ls.on_format") },
    },
    opts = function()
        local null_ls = require("null-ls")
        local null_ls_utils = require("null-ls.utils")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        return {
            root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
            sources = {
                formatting.stylua,
                formatting.prettier.with({ extra_filetypes = { "svelte" } }),
                formatting.csharpier,
                formatting.black,

                diagnostics.eslint_d.with({
                    condition = function(utils)
                        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
                    end,
                }),
                -- diagnostics.mypy,
                -- diagnostics.ruff,
            },
            -- configure format on save
            -- on_attach = on_attach,
        }
    end,
}
