local toggle_sidebar = function(sidebar)
    vim.opt.splitright = false
    -- sidebar.toggle()
    if not sidebar.close({ mode = 'toggle' }) then
        local _, win = sidebar.open()
        vim.api.nvim_set_current_win(win)
    end
    vim.opt.splitright = true
end
return function()
    local dap = require("dap")
    local widgets = require("dap.ui.widgets")
    local winopts = {
        width = 50,
        number = true,
        relativenumber = true,
    }
    local frames_sidebar = widgets.sidebar(widgets.frames, winopts)
    local scopes_sidebar = widgets.sidebar(widgets.scopes, winopts)

    return {
        { KEYS.f5, dap.continue },
        { KEYS.f10, dap.step_over },
        { KEYS.f11, dap.step_into },
        { KEYS.f12, dap.step_out },

        { KEYS.leader.d.c, dap.close },
        { KEYS.leader.d.j, dap.down },
        { KEYS.leader.d.k, dap.up },

        { KEYS.leader.b, dap.toggle_breakpoint },
        { KEYS.leader.B, dap.set_breakpoint },

        { KEYS.leader.d.r, dap.repl.toggle },
        { KEYS.leader.d.l, dap.run_last },
        { KEYS.leader.d.h, widgets.hover, mode = { "n", "v" } },
        -- { KEYS.leader.d.p, widgets.preview, mode = { "n", "v" } },
        { KEYS.leader.d.f, function() toggle_sidebar(frames_sidebar) end },
        { KEYS.leader.d.s, function() toggle_sidebar(scopes_sidebar) end },
    }
end
