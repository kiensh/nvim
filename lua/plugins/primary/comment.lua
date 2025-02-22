return {
    "numToStr/Comment.nvim",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    keys = {
        KEYS.g.c.c,
        KEYS.g.b.c,
        { KEYS.g.c.done, mode = "x" },
        { KEYS.g.b.done, mode = "x" },
    },
    opts = function()
        -- fix j/k position
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })
        return {
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        }
    end,
}
