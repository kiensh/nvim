return function(client, bufnr)
    -- print(vim.inspect(client.name))
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.api.nvim_set_current_dir(client.config.root_dir)

    -- set keybinds
    opts.desc = 'Show LSP references'
    vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

    opts.desc = 'Show LSP definitions'
    if client.name == 'omnisharp' then
        vim.keymap.set('n', 'gd', function()
            require('omnisharp_extended').telescope_lsp_definitions({
                layout_strategy = 'vertical',
                layout_config = {
                    width = 0.9,
                    height = 0.9,
                    prompt_position = 'top',
                    preview_cutoff = 120,
                    horizontal = { width = { padding = 0.15 } },
                    vertical = { preview_height = 0.75 },
                },
            })
        end, opts) -- show lsp definitions
    else
        vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- go to definition
    end

    opts.desc = 'Go to declaration'
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = 'Show LSP implementations'
    vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

    opts.desc = 'Show LSP type definitions'
    vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

    opts.desc = 'See available code actions'
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = 'Smart rename'
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = 'Show buffer diagnostics'
    -- vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

    opts.desc = 'Show line diagnostics'
    vim.keymap.set('n', '<leader>di', vim.diagnostic.open_float, opts) -- show diagnostics for line

    opts.desc = 'Go to previous diagnostic'
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

    opts.desc = 'Go to next diagnostic'
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

    opts.desc = 'Show documentation for what is under cursor'
    -- vim.keymap.set("n", "<leader>D", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = 'Restart LSP'
    vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
end
