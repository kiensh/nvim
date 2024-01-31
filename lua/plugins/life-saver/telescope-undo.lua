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
            -- ["<C-cr>"] = actions.restore,
            -- alternative defaults, for users whose terminals do questionable things with modified <cr>
            -- ["<C-y>"] = actions.yank_deletions,
            ["<C-r>"] = actions.restore,
        }
        return {
            extensions = {
                undo = {
                    use_delta = true,
                    use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo "$DIFF" | delta" }
                    side_by_side = false,
                    diff_context_lines = vim.o.scrolloff,
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
        -- Calling telescope"s setup from multiple specs does not hurt, it will happily merge the
        -- configs for us. We won"t use data, as everything is in it"s own namespace (telescope
        -- defaults, as well as each extension).
        require("telescope").setup(opts)
        require("telescope").load_extension("undo")
    end,
}
