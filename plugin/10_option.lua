MiniDeps.now(function()
  vim.g.mapleader = ' '

  vim.o.number = true

  vim.o.relativenumber = true

  vim.o.winborder = 'rounded'

  vim.o.completeopt = 'menuone,noselect,fuzzy'

  vim.o.scrolloff = 3

  vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
end)
