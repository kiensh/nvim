return {
    "zapling/mason-conform.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "stevearc/conform.nvim",
    },
    opts = {
        ensure_installed = {
            "stylua",
        },
        automatic_installation = true,
        quiet_mode = false,
    },
}
