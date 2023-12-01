local on_format = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            --  only use null-ls for formatting instead of lsp server
            return client.name == 'null-ls'
        end,
        ranga = {
            ['start'] = vim.api.nvim_buf_get_mark(0, '<'),
            ['end'] = vim.api.nvim_buf_get_mark(0, '>'),
        },
        bufnr = bufnr or vim.api.nvim_get_current_buf(),
        async = true,
    })
end

-- to setup format on save
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local on_attach = function(current_client, bufnr)
--   if current_client.supports_method("textDocument/formatting") then
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         on_format(bufnr)
--       end,
--     })
--   end
-- end

return on_format
