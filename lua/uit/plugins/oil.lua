return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        { '<leader>o', '<cmd>Oil<cr>', { desc = "Open parent directory" } },
        -- { '<leader>l', '<cmd>Oil<cr>' },
    },
    config = function()
        require('oil').setup({})

        vim.api.nvim_create_autocmd('BufWinEnter', {
            pattern = '*',
            callback = function()
                if vim.bo.ft ~= 'oil' then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false, silent = true }

                vim.keymap.set('n', 'q', ':bdelete!<CR>', opts)
            end,
        })
    end
}
