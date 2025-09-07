local H = {}

H.nmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set('n', '<Leader>' .. suffix, rhs, opts)
end

H.xmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set('x', '<Leader>' .. suffix, rhs, opts)
end

MiniDeps.now(function()
  vim.keymap.set('n', '<Leader>o', '<Cmd>lua MiniDiff.toggle_overlay()<CR>')

  vim.keymap.set('n', '<Leader>f', '<Cmd>Pick files<CR>')
  vim.keymap.set('n', '<Leader>q', '<Cmd>Pick grep_live<CR>')
  vim.keymap.set('n', '<Leader>h', '<Cmd>Pick help<CR>')
  vim.keymap.set('n', 'ZB', '<Cmd>lua MiniBufremove.delete()<CR>')
  vim.keymap.set('n', 'ZW', '<Cmd>lua MiniBufremove.wipeout()<CR>')

  vim.keymap.set('n', '<Leader>x', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end)

  vim.keymap.set('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
  vim.keymap.set('n', '<F2>', '<Cmd>lua vim.lsp.buf.rename()<CR>')
  vim.keymap.set({ 'n', 'x' }, 'gra', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
  vim.keymap.set('n', '<C-k>', '<Cmd>Pick lsp scope="document_symbol"<CR>')
  vim.keymap.set('n', '<F9>', '<Cmd>lua N0.toggle_quickfix()<CR>')

  H.nmap_leader('lt', '<Cmd>lua vim.lsp.buf.type_definition()<CR>')
  H.nmap_leader('li', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
  H.nmap_leader('ls', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
  H.nmap_leader('lfr', '<Cmd>Pick lsp scope="references"<CR>')
end)
