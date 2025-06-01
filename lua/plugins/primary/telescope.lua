return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
    cmd = { "Telescope" },
    keys = {
        { KEYS.leader.f.f, [[<cmd>Telescope find_files hidden=true follow=true<cr>]], desc = "Fuzzy find files in cwd" },
        { KEYS.leader.f.r, [[<cmd>Telescope oldfiles<cr>]], desc = "Fuzzy find recent files" },
        { KEYS.leader.f.s, [[<cmd>Telescope live_grep<cr>]], desc = "Find string in cwd" },
        { KEYS.leader.f.b, [[<cmd>Telescope buffers<cr>]], desc = "Fuzzy find buffers" },

        -- telescope git commands (not on youtube nvim video)
        { KEYS.leader.g.c, [[<cmd>Telescope git_commits<cr>]] }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
        { KEYS.leader.g.f, [[<cmd>Telescope git_files<cr>]] }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
        { KEYS.leader.g.b, [[<cmd>Telescope git_branches<cr>]] }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
        { KEYS.leader.g.s, [[<cmd>Telescope git_status<cr>]] }, -- list current changes per file with diff preview ["gs" for git status]
    },
    opts = {
        defaults = {
            path_display = { "truncate" },
            layout_strategy = "vertical",
            layout_config = {
                preview_cutoff = 1,
                prompt_position = "bottom",
                width = 0.8,
            },
            mappings = {
                i = {
                    [KEYS.ctrl.j] = function(...) require("telescope.actions").move_selection_next(...) end,
                    [KEYS.ctrl.k] = function(...) require("telescope.actions").move_selection_previous(...) end,
                    [KEYS.escape] = function(...) require("telescope.actions").close(...) end,
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")

        telescope.setup(opts)
        telescope.load_extension("fzf")
        telescope.load_extension("ui-select")
    end,
}
