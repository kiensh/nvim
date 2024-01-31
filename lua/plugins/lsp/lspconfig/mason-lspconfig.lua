return {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    dependencies = {
        'williamboman/mason.nvim',
    },
    opts = {
        -- list of servers for mason to install
        ensure_installed = {
            'lua_ls',
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure_installed
    },
}
