return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    local non_text = vim.api.nvim_get_hl(0, { name = 'NonText' })
    local float_title = vim.api.nvim_get_hl(0, { name = 'FloatTitle' })

    vim.api.nvim_set_hl(0, 'IndentIndent', non_text)
    vim.api.nvim_set_hl(0, 'IndentScope', float_title)

    return {
      enabled = true,
      indent = {
        char = '|',
        highlight = 'IndentIndent',
      },
      -- whitespace = { highlight = { "Whitespace", "NonText" } },
      scope = {
        enabled = true,
        char = '┃',
        show_start = false,
        highlight = 'IndentScope',
      },
    }
  end,
}
