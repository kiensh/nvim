return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    branch = "harpoon2",
    keys = {
        "å",
        "µ",

        "˜",
        "π",

        "¡",
        "™",
        "£",
        "¢",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "å", function() harpoon:list():add() end)
        vim.keymap.set("n", "µ", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "˜", function() harpoon:list():next() end)
        vim.keymap.set("n", "π", function() harpoon:list():prev() end)

        vim.keymap.set("n", "¡", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "™", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "£", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "¢", function() harpoon:list():select(4) end)
    end,
}
