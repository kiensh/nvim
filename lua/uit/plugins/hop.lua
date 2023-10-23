return {
    "smoka7/hop.nvim",
    event = "BufReadPre",
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        local hop = require("hop")
        hop.setup({
            -- keys = "etovxqpdygfblzhckisuran",
        })
        local directions = require("hop.hint").HintDirection
        vim.keymap.set("", "<leader><leader>f", function()
            hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
        end, { remap = true })
        vim.keymap.set("", "<leader><leader>F", function()
            hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
        end, { remap = true })
        vim.keymap.set("", "<leader><leader>l", function()
            hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, { remap = true })
        vim.keymap.set("", "<leader><leader>L", function()
            hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, { remap = true })
        vim.keymap.set("", "<leader><leader>t", function()
            hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 })
        end, { remap = true })
        vim.keymap.set("", "<leader><leader>T", function()
            hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
        end, { remap = true })
    end,
}
