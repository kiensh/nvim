return {
    'numToStr/Comment.nvim',
    -- event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = function()
        -- fix j/k position
        require('ts_context_commentstring').setup({
            enable_autocmd = false,
        })
        return {
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end,
    keys = {
        'gcc',
        'gbc',
        { 'gc', mode = 'x' },
        { 'gb', mode = 'x' },
    },
}
