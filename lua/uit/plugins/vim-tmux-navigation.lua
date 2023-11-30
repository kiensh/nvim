vim.g.tmux_navigator_no_mappings = 1
-- vim.g.tmux_navigator_save_on_switch = 2
-- vim.g.tmux_navigator_disable_when_zoomed = 1
-- vim.g.tmux_navigator_preserve_zoom = 1

return {
  'christoomey/vim-tmux-navigator',
  keys = {
    { '<C-h>', ':<C-U>TmuxNavigateLeft<cr>', silent = true },
    { '<C-j>', ':<C-U>TmuxNavigateDown<cr>', silent = true },
    { '<C-k>', ':<C-U>TmuxNavigateUp<cr>', silent = true },
    { '<C-l>', ':<C-U>TmuxNavigateRight<cr>', silent = true },
  },
}
