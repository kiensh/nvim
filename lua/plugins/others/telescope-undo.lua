vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undofiles"

return {
    "debugloop/telescope-undo.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "<leader>u", "<cmd>Telescope undo<cr>", desc = "undo history" },
    },
    opts = function()
        local actions = require("telescope-undo.actions")
        local mappings = {
            ["ya"] = actions.yank_additions,
            ["yd"] = actions.yank_deletions,
            ["<CR>"] = actions.yank_additions,
            ["<DEL>"] = actions.yank_deletions,
            -- ["<C-r>"] = actions.restore,
        }
        return {
            extensions = {
                undo = {
                    use_delta = true,
                    use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo "$DIFF" | delta" }
                    side_by_side = false,
                    vim_diff_opts = { ctxlen = vim.o.scrolloff },
                    entry_format = "state #$ID, $STAT, $TIME",
                    time_format = "",
                    saved_only = false,
                    mappings = {
                        i = mappings,
                        n = mappings,
                    },
                },
            },
        }
    end,
    config = function(_, opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("undo")
    end,
}
