local toggle_sidebar = function(sidebar)
    if not sidebar.close({ mode = 'toggle' }) then
        vim.opt.splitright = false
        local _, win = sidebar.open()
        vim.opt.splitright = true
        vim.api.nvim_set_current_win(win)
    end
end

local dap = require("dap")
local widgets = require("dap.ui.widgets")
local winopts = {
    width = 50,
    number = true,
    relativenumber = true,
}
local frames_sidebar = widgets.sidebar(widgets.frames, winopts)
local scopes_sidebar = widgets.sidebar(widgets.scopes, winopts)

vim.keymap.set("n", KEYS.f5, dap.continue)
vim.keymap.set("n", KEYS.f10, dap.step_over)
vim.keymap.set("n", KEYS.f11, dap.step_into)
vim.keymap.set("n", KEYS.f12, dap.step_out)

vim.keymap.set("n", KEYS.leader.d.c, dap.close)
vim.keymap.set("n", KEYS.leader.d.j, dap.down)
vim.keymap.set("n", KEYS.leader.d.k, dap.up)

vim.keymap.set("n", KEYS.leader.b, dap.toggle_breakpoint)
vim.keymap.set("n", KEYS.leader.B, dap.set_breakpoint)

vim.keymap.set("n", KEYS.leader.d.r, dap.repl.toggle)
vim.keymap.set("n", KEYS.leader.d.l, dap.run_last)
vim.keymap.set({"n", "v"}, KEYS.leader.d.h, widgets.hov)
-- vim.keymap.set({"n", "v"}, KEYS.leader.d.p, widgets.previ)
vim.keymap.set("n", KEYS.leader.d.f, function() toggle_sidebar(frames_sidebar) end)
vim.keymap.set("n", KEYS.leader.d.s, function() toggle_sidebar(scopes_sidebar) end)
