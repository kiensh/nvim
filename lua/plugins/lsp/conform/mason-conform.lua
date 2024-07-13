return {
    "zapling/mason-conform.nvim",
    lazy = true,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = { "stylua" },
        automatic_installation = true,
        quiet_mode = false,
    },
}
