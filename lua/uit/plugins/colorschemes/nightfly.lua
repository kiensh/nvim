return {
  'bluz71/vim-nightfly-colors',
  lazy = true,
  priority = 1000,
  config = function()
    vim.g.nightflyTransparent = true
    vim.g.nightflyCursorColor = false
    vim.g.nightflyNormalFloat = true
    vim.g.nightflyWinSeparator = 2
    vim.opt.fillchars = {
      horiz = '━',
      horizup = '┻',
      horizdown = '┳',
      vert = '┃',
      vertleft = '┫',
      vertright = '┣',
      verthoriz = '╋',
    }
    vim.g.nightflyUnderlineMatchParen = true
    vim.g.nightflyVirtualTextColor = true

    local custom_highlight = vim.api.nvim_create_augroup('CustomHighlight', {})
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'nightfly',
      callback = function()
        -- vim.api.nvim_set_hl(0, "Function", { fg = "#82aaff", bold = true })
        vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#1d3b53' })
        vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#1f1d2e' })
        vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#c792ea', bg = '#26233a' })
        vim.api.nvim_set_hl(0, 'StatusLineNc', { bg = '#1f1d2e' })

        vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#ae81ff' })

        vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#ae81ff' })
        vim.api.nvim_set_hl(0, 'FloatTitle', { fg = '#c792ea' })

        vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = '#c792ea' })
        vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = '#c792ea' })
        vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = '#c792ea' })

        vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { fg = '#b0c0c0' })
        vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = '#c792ea' })
        vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = '#c792ea' })
      end,
      group = custom_highlight,
    })
  end,
}
