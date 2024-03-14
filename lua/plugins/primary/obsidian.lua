vim.opt.conceallevel = 1

return {
    "epwalsh/obsidian.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        workspaces = {
            { name = "notes", path = "~/notes" },
        },
        completion = { nvim_cmp = true },
        mappings = {
            ["gd"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            ["<leader>ch"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
        },
        picker = {
            name = "telescope.nvim",
            mappings = {
                new = "<C-x>",
                insert_link = "<C-l>",
            },
        },
    },
}
