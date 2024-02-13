return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        {
            "<leader>sl",
            function()
                require("auto-session.session-lens").search_session()
            end,
            noremap = true,
        },
        { "<leader>ss", "<cmd>:SessionSave<CR>", noremap = true, silent = false },
        { "<leader>sr", "<cmd>:SessionRestore<CR>", noremap = true, silent = false },
    },
    opts = {
        log_level = "error",
        auto_session_enable_last_session = false,
        auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_suppress_dirs = nil,
        auto_session_use_git_branch = true,

        session_lens = {
            -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
            buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
            load_on_setup = true,
            theme_conf = {
                border = true,
                winblend = 0,
            },
            previewer = false,
        },
    },
}
