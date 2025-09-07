MiniDeps.now(function()
  MiniDeps.add {
    source = 'nvim-treesitter/nvim-treesitter',
    checkout = 'main',
  }

  MiniDeps.add {
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    checkout = 'main',
  }

  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
    },
  }
end)

MiniDeps.now(function()
  MiniDeps.add('rafamadriz/friendly-snippets')
end)

MiniDeps.later(function()
  MiniDeps.add('stevearc/conform.nvim')

  require('conform').setup {
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
  }
end)

MiniDeps.later(function()
  MiniDeps.add('ErichDonGubler/lsp_lines.nvim')

  require('lsp_lines').setup()
  vim.keymap.set('', '<Leader>k', require('lsp_lines').toggle, { desc = 'Toggle lsp_lines' })
end)

MiniDeps.later(function()
  MiniDeps.add('Wansmer/symbol-usage.nvim')

  local SymbolKind = vim.lsp.protocol.SymbolKind

  require('symbol-usage').setup {
    hl = { link = 'PmenuMatch' },

    kinds = { SymbolKind.Function, SymbolKind.Method },

    kinds_filter = {},

    vt_position = 'above',

    vt_priority = nil,

    request_pending_text = 'loading...',

    references = { enabled = true, include_declaration = false },

    definition = { enabled = false },

    implementation = { enabled = false },

    disable = { lsp = {}, filetypes = {}, cond = {} },

    symbol_request_pos = 'end', -- Recommended redefine only in `filetypes` override table

    symbol_filter = nil,

    -- text_format = function(symbol)
    --   local fragments = {}
    --
    --   -- Indicator that shows if there are any other symbols in the same line
    --   local stacked_functions = symbol.stacked_count > 0 and (' | +%s'):format(symbol.stacked_count) or ''
    --
    --   if symbol.references then
    --     local usage = symbol.references <= 1 and 'usage' or 'usages'
    --     local num = symbol.references == 0 and 'no' or symbol.references
    --     table.insert(fragments, ('%s %s'):format(num, usage))
    --   end
    --
    --   return table.concat(fragments, ', ') .. stacked_functions
    -- end,

    log = { enabled = false },
  }
end)
