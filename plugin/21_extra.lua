MiniDeps.now(function()
  MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'main',
  })

  MiniDeps.add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    checkout = 'main',
  })

  require('nvim-treesitter.configs').setup({
    highlight = {
      enable = true,
    },
  })
end)

MiniDeps.now(function()
  MiniDeps.add('rafamadriz/friendly-snippets')
end)

MiniDeps.later(function()
  MiniDeps.add('stevearc/conform.nvim')

  require('conform').setup({
    formatters_by_ft = {
      javascript = { 'prettier' },

      json = { 'prettier' },

      lua = { 'stylua' },

      python = { 'black' },

      go = { 'goimports', 'gofumpt' },
    },
    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 500,
    },
  })
end)

MiniDeps.later(function()
  MiniDeps.add('stevearc/overseer.nvim')

  local overseer = require('overseer')
  overseer.setup()
  local file = vim.fn.expand('%:p')

  overseer.register_template({
    -- Required fields
    name = 'Watch a typst file',
    builder = function(params)
      -- This must return an overseer.TaskDefinition
      return {
        -- cmd is the only required field. It can be a list or a string.
        cmd = { 'typst', 'watch', file },
        -- the list of components or component aliases to add to the task
        -- components = { 'my_custom_component', 'default' },
        components = { 'default' },
      }
    end,
    condition = {
      filetype = { 'typst' },
    },
  })
end)

MiniDeps.later(function()
  MiniDeps.add('ErichDonGubler/lsp_lines.nvim')

  require('lsp_lines').setup()
  vim.keymap.set('', '<Leader>k', require('lsp_lines').toggle, { desc = 'Toggle lsp_lines' })
end)
