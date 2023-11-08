return {
    'rmagatti/auto-session',
    config = function ()
        local auto_session = require('auto-session')
        auto_session.setup({
            log_level = "error",
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath('data') .. '/sessions/',
            auto_session_enabled = true,
            auto_save_enabled = true,
            auto_restore_enabled = true,
            auto_session_suppress_dirs = nil,
            auto_session_use_git_branch = nil,

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
        })

        vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, { noremap = true, })

        vim.cmd('autocmd BufWritePost * SessionSave')

        vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC>:wa<CR>:SessionSave<CR>", { noremap = true, silent = false })

        -- local auto_session_group = vim.api.nvim_create_augroup("auto-session-group", {})
        --
        -- vim.api.nvim_create_autocmd("BufWritePost", {
        --     group = auto_session_group,
        --     pattern = "*",
        --     callback = function()
        --         vim.cmd('SessionSave')
        --     end,
        -- })
    end
}
