return {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
        -- From: https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt#L4671-L4713
        vim.o.foldmethod = "expr"
        vim.o.foldexpr = "vimtex#fold#level(v:lnum)"
        vim.o.foldtext = "vimtex#fold#text()"

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
