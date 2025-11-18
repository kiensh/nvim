vim.opt.conceallevel = 2
vim.opt.concealcursor = "n"
local notes = vim.fn.expand("~") .. "/Workspaces/personal/notes"
return {
    "epwalsh/obsidian.nvim",
    event = {
        "BufReadPre " .. notes .. "/**",
        "BufNewFile " .. notes .. "/**",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        workspaces = {
            { name = "notes", path = notes },
        },
        completion = { nvim_cmp = false },
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
            [KEYS.enter] = {
                action = function()
                    return require("obsidian").util.smart_action()
                end,
                opts = { buffer = true, expr = true },
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
        follow_img_func = function(path)
            vim.fn.jobstart("open " .. path)
        end,
    },
}
