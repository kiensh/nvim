return {
    {
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
            copilot_model = "gpt-4o-copilot", -- Current LSP default is gpt-35-turbo, supports gpt-4o-copilot
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            -- model = "gpt-4o",
            -- model = "claude-3.7-sonnet-thought",
        },
        cmd = {
            "CopilotChat",
            "CopilotChatToggle",
            "CopilotChatClear",
            "CopilotChatNext",
            "CopilotChatPrev",
            "CopilotChatPrompt",

            "CopilotChatDocs",
            "CopilotChatReview",
            "CopilotChatFix",
            "CopilotChatExplain",
            "CopilotChatOptimize",
            "CopilotChatTests",
        },
    },
}
