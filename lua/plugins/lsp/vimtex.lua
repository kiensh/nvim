return {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
        -- From: https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt#L4671-L4713
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "tex",
            callback = function()
                vim.opt_local.foldmethod = "expr"
                vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
                vim.opt_local.foldtext = "vimtex#fold#text()"
            end,
        })

        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "",
            out_dir = ".latexmk",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            hooks = {},
            options = {
                "-verbose",
                "-bibtex",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
    end,
}
