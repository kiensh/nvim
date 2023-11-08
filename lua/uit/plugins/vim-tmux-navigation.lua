return {
    'christoomey/vim-tmux-navigator',
    config = function()
        vim.g.tmux_navigator_no_mappings = 1
        -- vim.g.tmux_navigator_save_on_switch = 2
        -- vim.g.tmux_navigator_disable_when_zoomed = 1
        -- vim.g.tmux_navigator_preserve_zoom = 1

        vim.keymap.set("n", "<C-h>", ":<C-U>TmuxNavigateLeft<cr>")
        vim.keymap.set("n", "<C-j>", ":<C-U>TmuxNavigateDown<cr>")
        vim.keymap.set("n", "<C-k>", ":<C-U>TmuxNavigateUp<cr>")
        vim.keymap.set("n", "<C-l>", ":<C-U>TmuxNavigateRight<cr>")
    end
}
