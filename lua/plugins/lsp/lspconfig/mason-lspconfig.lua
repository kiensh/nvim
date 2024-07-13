return {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
        handlers = nil,
    },
}
