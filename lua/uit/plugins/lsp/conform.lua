return {
  "stevearc/conform.nvim",
  -- cond = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },

      -- Conform will run multiple formatters sequentially
      python = { "black" },

      -- Use a sub-list to run only the first available formatter
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },

      -- Csharp
      cs = { { "csharpier" } },
    },
  },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      mode = { "n", "v" },
      desc = "Format file or range (in visual mode)",
    },
  },
}
