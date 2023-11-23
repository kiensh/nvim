local toggle_sidebar = function(sidebar)
  -- widgets.centered_float(widgets.frames)
  vim.opt.splitright = false
  sidebar.toggle()
  vim.opt.splitright = true
end

-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- "mfussenegger/nvim-dap-python",
    "jay-babu/mason-nvim-dap.nvim",
  },
  keys = function(_, _)
    local dap = require("dap")
    dap.set_log_level("TRACE")

    require("dap.ext.vscode").load_launchjs()
    -- require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")

    local widgets = require("dap.ui.widgets")
    local frames_sidebar = widgets.sidebar(widgets.frames, { width = 50, })
    local scopes_sidebar = widgets.sidebar(widgets.scopes, { width = 50, })

    local nvim_dap = vim.api.nvim_create_augroup("nvim-dap", {})
    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = nvim_dap,
      pattern = "dap-scopes-*",
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<Tab>", "<Cmd>lua require('dap.ui').trigger_actions({ mode = 'first' })<CR>", opts)
      end,
    })

    return {
      { "<Leader>dn", dap.continue },
      { "<Leader>dc", dap.close },
      { "<Leader>dj", dap.down },
      { "<Leader>dk", dap.up },

      { "<Leader>l", dap.step_over },
      { "<Leader>j", dap.step_into },
      { "<Leader>k", dap.step_out },

      { "<Leader>b", dap.toggle_breakpoint },
      { "<Leader>B", dap.set_breakpoint },
      -- { "<Leader>lp", dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) },

      { "<Leader>dr", dap.repl.toggle },
      { "<Leader>dl", dap.run_last },
      { "<Leader>dh", widgets.hover, mode = { "n", "v" } },
      -- { "<Leader>dp", widgets.preview, mode = { "n", "v" } },
      {
        "<Leader>df",
        function()
          toggle_sidebar(frames_sidebar)
        end,
      },
      {
        "<Leader>ds",
        function()
          toggle_sidebar(scopes_sidebar)
        end,
      },
    }
  end,
}
