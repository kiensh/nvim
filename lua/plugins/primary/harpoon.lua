return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    branch = "harpoon2",
    keys = {
        KEYS.alt.a,
        KEYS.alt.m,
        KEYS.alt.n,
        KEYS.alt.p,
        KEYS.alt.a1,
        KEYS.alt.a2,
        KEYS.alt.a3,
        KEYS.alt.a4,
        KEYS.alt.a5,
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", KEYS.alt.a, function() harpoon:list():add() end)
        vim.keymap.set("n", KEYS.alt.m, function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        vim.keymap.set("n", KEYS.alt.n, function() harpoon:list():next() end)
        vim.keymap.set("n", KEYS.alt.p, function() harpoon:list():prev() end)

        vim.keymap.set("n", KEYS.alt.a1, function() harpoon:list():select(1) end)
        vim.keymap.set("n", KEYS.alt.a2, function() harpoon:list():select(2) end)
        vim.keymap.set("n", KEYS.alt.a3, function() harpoon:list():select(3) end)
        vim.keymap.set("n", KEYS.alt.a4, function() harpoon:list():select(4) end)
        vim.keymap.set("n", KEYS.alt.a5, function() harpoon:list():select(5) end)
    end,
}
