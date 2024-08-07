return {
    "folke/trouble.nvim",
    keys = {
        { KEYS.leader.x.x, "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)", },
        { KEYS.leader.x.q, "<cmd>Trouble quickfix toggle focus=true<cr>", desc = "Diagnostics (Trouble)", },
    },
    opts = true,
}
