return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = KEYS.ctrl.l,
                accept_word = false,
                accept_line = false,
                next = KEYS.ctrl.rbracket,
                -- Disabled because <C-[> is represented as <Esc> in terminal
                -- prev = KEYS.ctrl.lbracket,
                dismiss = KEYS.ctrl.c,
            },
        },
        filetypes = {
            yaml = true,
            markdown = true,
            help = false,
            gitcommit = true,
            gitrebase = true,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = true,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
    },
}
