return {
    'akinsho/toggleterm.nvim',
    opts = {
        -- size = 10,
        size = function(term)
            if term.direction == 'horizontal' then
                return 15
            elseif term.direction == 'vertical' then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1,
        start_in_insert = true,
        persist_size = false,
        persist_mode = true,
        direction = 'horizontal',
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = 'curved',
            winblend = 0,
            highlights = {
                border = 'Normal',
                background = 'NormalFloat',
            },
        },
    },
    keys = {
        { '<C-\\>', '<Cmd>ToggleTerm<CR>', mode = 'n' },
        { '<ESC>', '<C-\\><C-n>', mode = 't' },
        -- { 'jk', "<C-\\><C-n>", mode = 't' },
        { '<C-h>', '<Cmd>wincmd h<CR>', mode = 't' },
        { '<C-j>', '<Cmd>wincmd j<CR>', mode = 't' },
        { '<C-k>', '<Cmd>wincmd k<CR>', mode = 't' },
        { '<C-l>', '<Cmd>wincmd l<CR>', mode = 't' },
        -- { '<C-w>', "<C-\\><C-n><C-w>", mode = 't' },
        { '<C-q>', '<C-\\><C-n><Cmd>bdelete!<CR>', mode = 't' },
    },
}
