vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })

vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
    pattern = "dap-*",
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", KEYS.tab, [[<Cmd>lua require("dap.ui").trigger_actions({ mode = "first" })<CR>]], opts)
        vim.keymap.set("n", KEYS.l, [[<Cmd>lua require("dap.ui").trigger_actions({ mode = "first" })<CR>]], opts)
        vim.keymap.set("n", KEYS.q, [[<Cmd>bdelete!<CR>]], opts)
    end,
})

return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        MY_OS.isMac() and "Cliffback/netcoredbg-macOS-arm64.nvim" or nil,
    },
    keys = require("plugins.lsp.nvim-dap.keymaps"),
    config = function()
        local dap = require("dap")
        dap.set_log_level("TRACE")
        require("dap.ext.vscode").load_launchjs()
    end,
}
