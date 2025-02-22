return {
    "lewis6991/gitsigns.nvim",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
            follow_files = true,
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", KEYS.rbracket.h, function()
                if vim.wo.diff then
                    return "]h"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", KEYS.lbracket.h, function()
                if vim.wo.diff then
                    return "[h"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            map("n", KEYS.leader.h.s, gs.stage_hunk)
            map("v", KEYS.leader.h.s, function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("n", KEYS.leader.h.S, gs.stage_buffer)
            map("n", KEYS.leader.h.x, gs.reset_hunk)
            map("v", KEYS.leader.h.x, function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end)
            map("n", KEYS.leader.h.X, gs.reset_buffer)

            map("n", KEYS.leader.h.u, gs.undo_stage_hunk)
            map("n", KEYS.leader.h.p, gs.preview_hunk)
            map("n", KEYS.leader.h.b, function()
                gs.blame_line({ full = true })
            end)
            map("n", KEYS.leader.h.d, gs.diffthis)
            map("n", KEYS.leader.h.D, function()
                gs.diffthis("~")
            end)
        end,
    },
}
