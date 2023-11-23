-- see if the file exists
local file_exists = function (file)
  local f = io.open(file, "rb")
  if f then
    f:close()
  end
  return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
local lines_from = function (file)
  if not file_exists(file) then
    return {}
  end
  local lines = {}
  for line in io.lines(file) do
    lines[#lines + 1] = line
  end
  return lines
end

-- tests the functions above
local file = ".lspconfig"
local lines = lines_from(file)

-- print all line numbers and their contents
-- for k, v in pairs(lines) do
--   print("line[" .. k .. "]", v)
-- end

return {
  "neovim/nvim-lspconfig",
  -- event = { "BufReadPre", "BufNewFile" },
  cond = function(_)
    if next(lines) == nil then
      return false
    end
    return true
  end,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "williamboman/mason-lspconfig.nvim",
    "Hoffs/omnisharp-extended-lsp.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")
    -- local util = require("lspconfig.util")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local on_attach = require("uit.plugins.lsp.lspconfig.on_attach")

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local list_lsp = require('uit.plugins.lsp.lspconfig.list-lsp')

    for _, v in pairs(lines) do
      local lsp = list_lsp[v]
      if lsp ~= nil then
        lsp["on_attach"] = on_attach
        lsp["capabilities"] = capabilities
        lspconfig[v].setup(lsp)
      end
    end
  end,
}
