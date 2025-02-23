local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins.primary" },
    { import = "plugins.colorschemes" },
    { import = "plugins.others" },
    { import = "plugins.lsp" },
    {
        {
            "3rd/image.nvim",
            build = false,
            opts = {
                backend = "kitty",
                processor = "magick_cli",
            },
        },
    },
}, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false,
    },
    ui = {
        border = "double",
        size = {
            width = 0.8,
            height = 0.8,
        },
    },
})

vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[colorscheme rose-pine]])
-- vim.cmd([[colorscheme tokyonight]])
