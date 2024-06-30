return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    opts = {
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = { "lua", "vim" },
        ignore_install = { "help" },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
