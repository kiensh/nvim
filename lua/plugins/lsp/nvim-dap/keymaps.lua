return function()
    local dap = require("dap")
    local widgets = require("dap.ui.widgets")
    local frames_sidebar = widgets.sidebar(widgets.frames, { width = 50 })
    local scopes_sidebar = widgets.sidebar(widgets.scopes, { width = 50 })

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
                vim.opt.splitright = false
                frames_sidebar.toggle()
                vim.opt.splitright = true
            end,
        },
        {
            KEYS.leader.d.s,
            function()
                vim.opt.splitright = false
                scopes_sidebar.toggle()
                vim.opt.splitright = true
            end,
        },
    }
end
