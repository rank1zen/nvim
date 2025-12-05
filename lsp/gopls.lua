local settings = {
  gopls = {
    gofumpt = true,
    codelenses = {
      gc_details = false,
      generate = true,
      regenerate_cgo = true,
      run_govulncheck = true,
      test = true,
      tidy = true,
      upgrade_dependency = true,
      vendor = true,
    },
    analyses = {
      unusedparams = true,
      unusedvariable = true,
      unusedwrite = true,
    },
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      compositeLiteralTypes = true,
      constantValues = true,
      parameterNames = true,
      rangeVariableTypes = true,
    },
  },
}

---@type vim.lsp.Config
local M = {
  cmd = {
    'gopls',
  },
  filetypes = {
    'go',
    'gomod',
    'gowork',
    'gotmpl',
  },
  root_markers = {
    'go.work',
    'go.mod',
    '.git',
  },
  settings = settings,
}

return M
