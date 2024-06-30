local push = function()
    vim.cmd.Git("push")
end
local pull = function()
    vim.cmd.Git({ "pull", "--rebase" })
end

return {
    "tpope/vim-fugitive",
    cmd = {
        "Git",
        "G",
    },
    keys = {
        -- { "<leader>g", "<cmd>Git<CR>" },
    },
    config = function()

        vim.api.nvim_create_autocmd("BufWinEnter", {
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false, silent = true }

                vim.keymap.set("n", "<leader>gp", push, opts)

                -- rebase always
                vim.keymap.set("n", "<leader>gP", pull, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts)

                vim.keymap.set("n", "q", ":bdelete!<CR>", opts)
            end,
        })
    end,
}
