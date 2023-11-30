return {
  'jayp0521/mason-null-ls.nvim',
  lazy = true,
  dependencies = {
    'williamboman/mason.nvim',
  },
  opts = {
    -- list of formatters & linters for mason to install
    ensure_installed = {
      'stylua', -- lua formatter
      -- "prettier", -- ts/js formatter
      -- "eslint_d", -- ts/js linter
      -- "csharpier",
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true,
  },
}
