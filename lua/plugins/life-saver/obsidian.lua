vim.opt.conceallevel = 1
local notes = vim.fn.expand("~") .. "/Workspaces/personal/notes"
return {
    "epwalsh/obsidian.nvim",
    event = {
        "BufReadPre " .. notes .. "/**",
        "BufNewFile " .. notes .. "/**",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        workspaces = {
            { name = "notes", path = notes },
        },
        completion = { nvim_cmp = true },
        mappings = {
            [KEYS.g.d] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            [KEYS.leader.c.h] = {
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
        follow_url_func = function(url)
            vim.fn.jobstart({ "open", url })
        end,
    },
}
