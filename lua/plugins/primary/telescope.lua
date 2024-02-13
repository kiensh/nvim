return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = { "Telescope" },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
        { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
        { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },

        -- telescope git commands (not on youtube nvim video)
        { "<leader>gc", "<cmd>Telescope git_commits<cr>" }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
        { "<leader>gf", "<cmd>Telescope git_files<cr>" }, -- list all git commits (use <cr> to checkout) ["gc" for git commits]
        -- { "<leader>gfc", "<cmd>Telescope git_bcommits<cr>" }, -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
        { "<leader>gb", "<cmd>Telescope git_branches<cr>" }, -- list git branches (use <cr> to checkout) ["gb" for git branch]
        { "<leader>gs", "<cmd>Telescope git_status<cr>" }, -- list current changes per file with diff preview ["gs" for git status]
    },
    opts = {
        defaults = {
            path_display = { "truncate" },
            layout_strategy = "horizontal",
            layout_config = {
                height = 0.9,
                preview_cutoff = 1,
                prompt_position = "bottom",
                width = 0.8,
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = false, -- override the generic sorter
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
    end,
}
