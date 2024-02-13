vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- general keymap
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", opts) -- clear search highlights
vim.keymap.set("n", "<leader>q", ":bdelete!<CR>", opts)
vim.keymap.set("n", "Q", ":%bd|e#<CR>", opts)

-- vim.keymap.set('n', '<leader>=', '<C-a>', opts) -- increase a number
-- vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrease

vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC>:wa<CR>", opts)
vim.keymap.set("n", "<leader>rp", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left> <BS>]])
vim.keymap.set("n", "<leader>rP", [[:%s/<C-r>*/<C-r>*/gI<Left><Left><Left> <BS>]])
vim.keymap.set("v", "<leader>rp", [[:s///gI<Left><Left><Left><Left> <BS>]])

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- vim.keymap.set("n", "w", "w2zl", opts)
-- vim.keymap.set("n", "b", "b2zh", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- yank, putting
vim.keymap.set("x", "p", '"_dP', opts)
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y', opts)
vim.keymap.set({ "n" }, "<leader>p", '"+p', opts)
vim.keymap.set({ "n" }, "<leader>P", '"+P', opts)
vim.keymap.set({ "x" }, "<leader>p", '"_d"+P', opts)
-- vim.keymap.set({ "v" }, "<leader>P", '"_d"+P', opts)

-- vim.keymap.set({ "v", "n" }, "<leader>d", '"_d', opts)
-- vim.keymap.set({ "v", "n" }, "<leader>c", '"_c', opts)

-- Move text up and down
vim.keymap.set("n", "∆", ":m .+1<CR>==", opts)
vim.keymap.set("n", "˚", ":m .-2<CR>==", opts)
vim.keymap.set("i", "∆", "<ESC>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "˚", "<ESC>:m .-2<CR>==gi", opts)
vim.keymap.set("v", "∆", ":m .+1<CR>gv=gv", opts)
vim.keymap.set("v", "˚", ":m .-2<CR>gv=gv", opts)

-- Move text left and right
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- Visual Block --
-- Move text up and down
-- vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", opts)
-- vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("x", "∆", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("x", "˚", ":m '<-2<CR>gv=gv", opts)

-- screen management
vim.keymap.set("n", "<leader>sv", ":vert split<CR>", opts) -- split window vertically
vim.keymap.set("n", "<leader>sh", ":hor split<CR>", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", ":vert wincmd =<CR>", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- tab management
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- netrw
vim.keymap.set("n", "<C-e>", vim.cmd.Explore, opts)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "netrw" },
    callback = function(e)
        local cb_opts = { buffer = e.buf, remap = true, silent = true }

        vim.keymap.set("n", "h", "-", cb_opts)
        vim.keymap.set("n", "l", "<CR>", cb_opts)
        vim.keymap.set("n", "<Tab>", "<CR>", cb_opts)
    end,
})

-- Output the current highlights group
-- vim.keymap.set("n", "<leader>hg", ":lua print(vim.inspect(vim.api.nvim_get_hl(0, {})))<CR>", opts)

-- screen navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- Scroll  characters to the left
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- Scroll  characters to the right
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
