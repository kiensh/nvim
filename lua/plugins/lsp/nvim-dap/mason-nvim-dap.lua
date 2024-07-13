return {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = true, -- loaded by nvim-dap
    dependencies = {
        "williamboman/mason.nvim",
        MY_OS.isMac() and LIST_LSPCONFIG["omnisharp"]
            and "Cliffback/netcoredbg-macOS-arm64.nvim"
            or nil,
    },
    opts = {
        ensure_installed = {},
        automatic_installation = false, -- only install from dap not hanlders
        handlers = {
            function(config) require("mason-nvim-dap").default_setup(config) end,
            coreclr = require("plugins.lsp.nvim-dap.handlers.coreclr"),
            bash = require("plugins.lsp.nvim-dap.handlers.bashdb"),
            firefox = require("plugins.lsp.nvim-dap.handlers.firefox"),
        },
    },
}
