-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- on_attach
local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- use all default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- copy default mappings here from defaults in next section
  vim.keymap.set("n", "h", api.node.navigate.parent, opts("node.navigate.parent"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("node.open.edit"))
  vim.keymap.set("n", "<C-j>", api.node.navigate.sibling.next, opts("node.navigate.sibling.next"))
  vim.keymap.set("n", "<C-k>", api.node.navigate.sibling.prev, opts("node.navigate.sibling.prev"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("node.open.vertical"))
  vim.keymap.set("n", "x", api.node.open.horizontal, opts("node.open.horizontal"))
  vim.keymap.set("n", "<C-x>", api.fs.cut, opts("fs.cut"))
  vim.keymap.set("n", "<C-c>", api.fs.copy.node, opts("fs.copy.node"))
  vim.keymap.set("n", "<C-v>", api.fs.paste, opts("fs.paste"))
  -- vim.keymap.set('n', '<',    api.node.navigate.parent_close,             opts('node.navigate.parent_close'))
  -- vim.keymap.set("n", ">", api.node.navigate.opened.next, opts("node.navigate.opened.next"))
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  ---
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sort_by = "case_sensitive",
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
            arrow_closed = "", -- arrow when folder is closed
            arrow_open = "", -- arrow when folder is open
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
      custom = { ".DS_Store", "^node_modules$", "^\\.git$" },
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
    { "<leader>e", "<cmd>NvimTreeFindFile<CR>", desc = "Find file explorer on current file" }, -- toggle file explorer on current filem
    -- { "<A-c>", require("nvim-tree.api").fs.copy.absolute_path, desc = "Toggle file explorer on current file" }, -- toggle file explorer on current filem
    -- { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },           -- collapse file explorerm
    -- { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },           -- collapse file explorerm
    -- { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },             -- refresh file explorerm
  },
}
