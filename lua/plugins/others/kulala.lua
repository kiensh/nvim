vim.filetype.add({
    extension = {
        ["http"] = "http",
        ["rest"] = "http",
    },
})
return {
    "mistweaverco/kulala.nvim",
    ft = "http",
    opts = {
        ui = {
            display_mode = "float",
            winbar = false,
        },
        environment_scope = "b",
        debug = true,
        global_keymaps = false,
        kulala_keymaps = {
            ["Show verbose"] = false, -- set false to disable
        },
    },
    keys = {
        {
            KEYS.lbracket.done,
            function()
                require("kulala").jump_prev()
            end,
            ft = "http",
        },
        {
            KEYS.rbracket.done,
            function()
                require("kulala").jump_next()
            end,
            ft = "http",
        },
        {
            KEYS.enter,
            function()
                require("kulala").run()
            end,
            ft = "http",
        },
        {
            KEYS.leader.k.o,
            function()
                require("kulala").open()
            end,
            ft = "http",
        },
        {
            KEYS.K,
            function()
                require("kulala").inspect()
            end,
            ft = "http",
        },
        {
            KEYS.leader.k.e,
            function()
                require("kulala").set_selected_env()
            end,
            ft = "http",
        },
    },
}
