return {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    config = function()
        vim.api.nvim_create_autocmd("BufWinEnter", {
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false, silent = true }

                vim.keymap.set("n", KEYS.q, ":bdelete!<CR>", opts)
            end,
        })
    end,
}
