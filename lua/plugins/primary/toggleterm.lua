return {
    "akinsho/toggleterm.nvim",
    keys = {
        { KEYS.ctrl.bslash, [[<Cmd>ToggleTerm<CR>]], mode = "n" },
        { KEYS.esc_esc, [[<C-\><C-n>]], mode = "t" },
        -- { KEYS.ctrl.h, [[<Cmd>wincmd h<CR>]], mode = "t" },
        { KEYS.ctrl.j, [[<Cmd>wincmd j<CR>]], mode = "t" },
        { KEYS.ctrl.k, [[<Cmd>wincmd k<CR>]], mode = "t" },
        -- { KEYS.ctrl.l, [[<Cmd>wincmd l<CR>]], mode = "t" },
        { KEYS.ctrl.q, [[<C-\><C-n><Cmd>bdelete!<CR>]], mode = "t" },
    },
    opts = {
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.6
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = KEYS.ctrl.bslash,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        persist_size = false,
        persist_mode = false,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "NormalFloat",
            },
        },
    },
}
