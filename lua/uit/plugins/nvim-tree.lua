--- @recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--- @change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

--- @on_attach
local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    --- @use all default mappings
    -- api.config.mappings.default_on_attach(bufnr)

    --- @tree
    vim.keymap.set('n', 'q', api.tree.close, opts('tree.close'))
    vim.keymap.set('n', '<C-r>', api.tree.reload, opts('tree.reload'))
    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('tree.change_root_to_node'))
    vim.keymap.set('n', '<C-[>', api.tree.change_root_to_parent, opts('tree.change_root_to_parent'))
    vim.keymap.set('n', 'R', api.tree.collapse_all, opts('tree.collapse_all'))
    vim.keymap.set('n', 'M', api.tree.expand_all, opts('tree.expand_all'))
    vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('tree.toggle_no_buffer_filter'))
    vim.keymap.set('n', 'G', api.tree.toggle_gitignore_filter, opts('tree.toggle_gitignore_filter'))

    --- @open
    vim.keymap.set('n', 'l', api.node.open.edit, opts('node.open.edit'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('node.open.preview'))
    vim.keymap.set('n', 'V', api.node.open.vertical, opts('node.open.vertical'))
    vim.keymap.set('n', 'X', api.node.open.horizontal, opts('node.open.horizontal'))

    --- @copy/cut/paste
    vim.keymap.set('n', 'x', api.fs.cut, opts('fs.cut'))
    vim.keymap.set('n', 'y', api.fs.copy.node, opts('fs.copy.node'))
    vim.keymap.set('n', 'p', api.fs.paste, opts('fs.paste'))
    vim.keymap.set('n', '<M-c>', api.fs.copy.absolute_path, opts('fs.copy.absolute_path'))

    --- @file-system
    vim.keymap.set('n', 'a', api.fs.create, opts('fs.create'))
    vim.keymap.set('n', 'd', api.fs.trash, opts('fs.trash'))
    vim.keymap.set('n', 'D', api.fs.remove, opts('fs.remove'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('fs.rename'))

    --- @navigate
    vim.keymap.set('n', 'h', api.node.navigate.parent, opts('node.navigate.parent'))
    vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('node.navigate.sibling.last'))
    vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('node.navigate.sibling.first'))
    vim.keymap.set('n', '<C-j>', api.node.navigate.sibling.next, opts('node.navigate.sibling.next'))
    vim.keymap.set('n', '<C-k>', api.node.navigate.sibling.prev, opts('node.navigate.sibling.prev'))

    --- @help
    vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
end

return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        sort_by = 'case_sensitive',
        view = {
            width = 60,
            relativenumber = true,
        },
        -- change folder arrow icons
        renderer = {
            indent_width = 2,
            indent_markers = {
                enable = true,
                inline_arrows = false,
            },
            group_empty = true,
            -- highlight_git = true,
            -- highlight_modified = "icon", -- "none", "icon", "name" or "all"
            icons = {
                glyphs = {
                    folder = {
                        arrow_closed = '', -- arrow when folder is closed
                        arrow_open = '', -- arrow when folder is open
                    },
                },
            },
        },
        actions = {
            open_file = {
                quit_on_open = true,
                window_picker = {
                    enable = false,
                },
            },
        },
        filters = {
            custom = { '.DS_Store', '^node_modules$', '^\\.git$' },
            git_ignored = true,
        },
        git = {
            ignore = false,
        },
        sync_root_with_cwd = true,
        on_attach = on_attach,
    },
    keys = {
        -- { "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" }, -- toggle file explorer on current file
        -- { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },               -- toggle file explorerm
        { '<leader>e', '<cmd>NvimTreeFindFile<CR>', desc = 'Find file explorer on current file' }, -- toggle file explorer on current filem
        -- { "<A-c>", require("nvim-tree.api").fs.copy.absolute_path, desc = "Toggle file explorer on current file" }, -- toggle file explorer on current filem
        -- { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },           -- collapse file explorerm
        -- { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },           -- collapse file explorerm
        -- { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },             -- refresh file explorerm
    },
}
