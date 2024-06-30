local toggle_sidebar = function(sidebar)
    -- widgets.centered_float(widgets.frames)
    vim.opt.splitright = false
    sidebar.toggle()
    vim.opt.splitright = true
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })

return {
    "mfussenegger/nvim-dap",
    enabled = false,
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
        local frames_sidebar = widgets.sidebar(widgets.frames, { width = 50 })
        local scopes_sidebar = widgets.sidebar(widgets.scopes, { width = 50 })

        local nvim_dap = vim.api.nvim_create_augroup("nvim-dap", {})
        vim.api.nvim_create_autocmd("BufWinEnter", {
            group = nvim_dap,
            -- pattern = "dap-scopes-*",
            pattern = "dap-*",
            callback = function()
                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", KEYS.tab, [[<Cmd>lua require("dap.ui").trigger_actions({ mode = "first" })<CR>]], opts)
                vim.keymap.set("n", KEYS.q, [[<Cmd>bdelete!<CR>]], opts)
            end,
        })

        return {
            { KEYS.leader.d.n, dap.continue },
            { KEYS.leader.d.c, dap.close },
            { KEYS.leader.d.j, dap.down },
            { KEYS.leader.d.k, dap.up },

            { KEYS.leader.l, dap.step_over },
            { KEYS.leader.j, dap.step_into },
            { KEYS.leader.k, dap.step_out },

            { KEYS.leader.b, dap.toggle_breakpoint },
            { KEYS.leader.B, dap.set_breakpoint },

            { KEYS.leader.d.r, dap.repl.toggle },
            { KEYS.leader.d.l, dap.run_last },
            { KEYS.leader.d.h, widgets.hover, mode = { "n", "v" } },
            -- { KEYS.leader.d.p, widgets.preview, mode = { "n", "v" } },
            {
                KEYS.leader.d.f,
                function()
                    toggle_sidebar(frames_sidebar)
                end,
            },
            {
                KEYS.leader.d.s,
                function()
                    toggle_sidebar(scopes_sidebar)
                end,
            },
        }
    end,
}
