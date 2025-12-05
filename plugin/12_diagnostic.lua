local diagnostic_opts = {
  signs = { priority = 9999, severity = { min = 'WARN', max = 'ERROR' } },

  underline = { severity = { min = 'HINT', max = 'ERROR' } },

  virtual_lines = false,

  virtual_text = false, -- { current_line = true, severity = { min = 'ERROR', max = 'ERROR' } },

  update_in_insert = false,
}

MiniDeps.later(function()
  vim.diagnostic.config(diagnostic_opts)
end)
