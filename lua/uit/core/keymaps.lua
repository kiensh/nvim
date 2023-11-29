vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- general keymap
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", opts) -- clear search highlights
vim.keymap.set("n", "<leader>q", ":bdelete!<CR>", opts) -- clear search highlights
vim.keymap.set("n", "Q", ":%bd|e#<CR>", opts) -- clear search highlights

vim.keymap.set("n", "<leader>=", "<C-a>", opts) -- increase a number
vim.keymap.set("n", "<leader>-", "<C-x>", opts) -- decrease

vim.keymap.set({ "n", "i" }, "<C-s>", "<ESC>:wa<CR>", opts)
-- vim.keymap.set({ "n" }, "<C-a>", "gg<S-v><S-g>", opts)
-- vim.keymap.set("i", "<C-z>", "<ESC>ua", opts)
-- vim.keymap.set("i", "<C-Z>", "<ESC><C-r>a", opts)
-- vim.keymap.set("i", "<C-o>", "<C-O>o", opts)
-- vim.keymap.set("i", "<C-O>", "<C-O>O", opts)-- vim.keymap.set("i", "<C-O>", "<C-O>O", opts)
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
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("i", "<A-j>", "<ESC>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<A-k>", "<ESC>:m .-2<CR>==gi", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>gv=gv", opts)
vim.keymap.set("v", "<A-j>", ":m .+1<CR>gv=gv", opts)

-- Move text left and right
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("v", "<", "<gv", opts)

-- Visual Block --
-- Move text up and down
-- vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", opts)
-- vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

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
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, opts)

-- Output the current highlights group
-- vim.keymap.set("n", "<leader>hg", ":lua print(vim.inspect(vim.api.nvim_get_hl(0, {})))<CR>", opts)

-- screen scroll
-- vim.keymap.set("n", "<S-h>", "20zh", opts) -- Scroll  characters to the left
-- vim.keymap.set("n", "<S-l>", "20zl", opts) -- Scroll  characters to the right
-- vim.keymap.set("n", "<S-k>", "10<C-u>zz", opts)
-- vim.keymap.set("n", "<S-j>", "10<C-d>zz", opts)
