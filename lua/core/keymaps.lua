local keymap = function(mode, key, value)
    local opts = { noremap = true, silent = true }
    vim.keymap.set(mode, key, value, opts)
end

-- general keymap
vim.g.mapleader = KEYS.space
keymap("i", KEYS.j.k, [[<ESC>]])
keymap("i", KEYS.escape, [[<ESC>]])
keymap("n", KEYS.leader.n.h, [[:nohl<CR>]])
keymap("n", KEYS.leader.q, [[:bdelete!<CR>]])
keymap("n", KEYS.Q, [[:%bd|e#<CR>]])

-- keymap("n", "<leader>=", [[<C-a>]]) -- increase a number
-- keymap("n", "<leader>-", [[<C-x>]]) -- decrease

keymap({ "n", "i" }, KEYS.ctrl.s, [[<ESC>:wa<CR>]])
keymap("n", KEYS.leader.r.p, [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left> <BS>]])
keymap("n", KEYS.leader.r.P, [[:%s/<C-r>*/<C-r>*/gI<Left><Left><Left> <BS>]])
keymap("v", KEYS.leader.r.p, [[:s///gI<Left><Left><Left><Left> <BS>]])

keymap("n", KEYS.ctrl.d, [[<C-d>zz]])
keymap("n", KEYS.ctrl.u, [[<C-u>zz]])

keymap("n", KEYS.n, [[nzzzv]])
keymap("n", KEYS.N, [[Nzzzv]])

-- yank, putting
keymap("x", KEYS.p, [["_dP]])
keymap({ "v", "n" }, KEYS.leader.y, [["+y]])
keymap({ "n" }, KEYS.leader.p, [["+p]])
keymap({ "n" }, KEYS.leader.P, [["+P]])
keymap({ "x" }, KEYS.leader.p, [["_d"+P]])

-- Move text up and down
keymap("n", KEYS.alt.j, [[:m .+1<CR>==]])
keymap("n", KEYS.alt.k, [[:m .-2<CR>==]])
keymap("x", KEYS.alt.j, [[:m '>+1<CR>gv=gv]])
keymap("x", KEYS.alt.k, [[:m '<-2<CR>gv=gv]])

-- Move text left and right
keymap("v", KEYS.gt, [[>gv]])
keymap("v", KEYS.lt, [[<gv]])

-- screen management
keymap("n", KEYS.leader.s.v, [[:vert split<CR>]]) -- split window vertically
keymap("n", KEYS.leader.s.h, [[:hor split<CR>]]) -- split window horizontally
keymap("n", KEYS.leader.s.e, [[:vert wincmd =<CR>]]) -- make split windows equal width & height
keymap("n", KEYS.leader.s.x, [[:close<CR>]]) -- close current split window

-- tab management
keymap("n", KEYS.leader.t.o, [[:tabnew<CR>]]) -- open new tab
keymap("n", KEYS.leader.t.x, [[:tabclose<CR>]]) -- close current tab
keymap("n", KEYS.leader.t.n, [[:tabn<CR>]]) --  go to next tab
keymap("n", KEYS.leader.t.p, [[:tabp<CR>]]) --  go to previous tab

-- netrw
keymap("n", KEYS.ctrl.e, vim.cmd.Explore)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "netrw" },
    callback = function(e)
        local opts = { buffer = e.buf, remap = true, silent = true }
        vim.keymap.set("n", KEYS.h, [[-]], opts)
        vim.keymap.set("n", KEYS.l, [[<CR>]], opts)
        vim.keymap.set("n", KEYS.tab, [[<CR>]], opts)
    end,
})

-- screen navigation
keymap("n", KEYS.ctrl.h, [[<C-w>h]])
keymap("n", KEYS.ctrl.j, [[<C-w>j]])
keymap("n", KEYS.ctrl.k, [[<C-w>k]])
keymap("n", KEYS.ctrl.l, [[<C-w>l]])
