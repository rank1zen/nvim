---@type vim.lsp.Config
return {
  cmd = {
    'go',
    'tool',
    'templ',
    'lsp'
  },
  filetypes = {
    'templ'
  },
  root_markers = {
    'go.work',
    'go.mod',
  },
}
