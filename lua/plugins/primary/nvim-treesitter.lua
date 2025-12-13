return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
            disable = { "latex" },
        },
        indent = { enable = true },
        fold = { enable = true },
        ensure_installed = { "lua" },
        ignore_install = { "vim" },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
