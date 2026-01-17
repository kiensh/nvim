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
                gitcommit = true,
                gitrebase = true,
                ["."] = true,
                -- Explicitly disable problematic filetypes for better performance
                help = false,
                hgcommit = false,
                svn = false,
                cvs = false,
            },
            copilot_node_command = "node",
            copilot_model = "gpt-5.1",
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            "zbirenbaum/copilot.lua",
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            -- Core configuration
            system_prompt = "COPILOT_INSTRUCTIONS",
            model = "claude-sonnet-4.5",
            agent = "copilot",
            context = nil,
            sticky = nil,

            -- Performance settings
            temperature = 0.1,
            headless = false,
            stream = nil,
            callback = nil,
            remember_as_sticky = true,

            -- Window configuration
            window = {
                layout = "vertical",
                width = 0.5,
                height = 0.5,
                relative = "editor",
                border = "single",
                title = "Copilot Chat",
                zindex = 1,
            },

            -- UI settings
            show_help = true,
            highlight_selection = true,
            highlight_headers = true,
            references_display = "virtual",
            auto_follow_cursor = true,
            auto_insert_mode = false,
            insert_at_end = false,
            clear_chat_on_new_prompt = false,

            -- System configuration
            debug = false,
            log_level = "info",
            proxy = nil,
            allow_insecure = false,
            chat_autocomplete = true,

            -- Cached paths for better performance
            log_path = vim.fn.stdpath("state") .. "/CopilotChat.log",
            history_path = vim.fn.stdpath("data") .. "/copilotchat_history",

            -- Headers and UI elements
            question_header = "# User ",
            answer_header = "# Copilot ",
            error_header = "# Error ",
            separator = "───",

            -- Providers (simplified)
            providers = {
                copilot = {},
                github_models = {},
                copilot_embeddings = {},
            },

            -- Contexts (simplified)
            contexts = {
                buffer = {},
                buffers = {},
                file = {},
                files = {},
                git = {},
                url = {},
                register = {},
                quickfix = {},
                system = {},
            },

            -- Essential prompts with clear purpose
            prompts = {
                Explain = {
                    prompt = "Write an explanation for the selected code as paragraphs of text.",
                    system_prompt = "COPILOT_EXPLAIN",
                },
                Review = {
                    prompt = "Review the selected code.",
                    system_prompt = "COPILOT_REVIEW",
                },
                Fix = {
                    prompt = "There is a problem in this code. Identify the issues and rewrite the code with fixes. Explain what was wrong and how your changes address the problems.",
                },
                Optimize = {
                    prompt = "Optimize the selected code to improve performance and readability. Explain your optimization strategy and the benefits of your changes.",
                },
                Docs = {
                    prompt = "Please add documentation comments to the selected code.",
                },
                Tests = {
                    prompt = "Please generate tests for my code.",
                },
                Commit = {
                    prompt = "Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.",
                    context = "git:staged",
                },
            },

            -- Streamlined mappings
            mappings = {
                complete = { insert = "<Tab>" },
                close = { normal = "q", insert = "<C-c>" },
                reset = { normal = "<C-l>", insert = "<C-l>" },
                submit_prompt = { normal = "<CR>", insert = "<C-s>" },
                toggle_sticky = { normal = "grr" },
                clear_stickies = { normal = "grx" },
                accept_diff = { normal = "<C-y>", insert = "<C-y>" },
                jump_to_diff = { normal = "gj" },
                quickfix_answers = { normal = "gqa" },
                quickfix_diffs = { normal = "gqd" },
                yank_diff = { normal = "gy", register = '"' },
                show_diff = { normal = "gd", full_diff = false },
                show_info = { normal = "gi" },
                show_context = { normal = "gc" },
                show_help = { normal = "gh" },
            },
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
