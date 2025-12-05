local H = {}

MiniDeps.now(function()
  require('mini.sessions').setup()
end)

MiniDeps.now(function()
  require('mini.basics').setup()
end)

MiniDeps.now(function()
  require('mini.starter').setup()
end)

MiniDeps.later(function()
  require('mini.statusline').setup(H.mini_statusline_config())
end)

MiniDeps.later(function()
  require('mini.extra').setup()
end)

MiniDeps.later(function()
  require('mini.tabline').setup(H.mini_tabline_config())
end)

MiniDeps.later(function()
  require('mini.ai').setup(H.mini_ai_config())
end)

MiniDeps.later(function()
  require('mini.align').setup()
end)

MiniDeps.later(function()
  require('mini.trailspace').setup()
end)

MiniDeps.later(function()
  require('mini.completion').setup(H.mini_completion_config())
end)
MiniDeps.later(function()
  H.apply_mini_completion_autocmds()
end)

MiniDeps.later(function()
  require('mini.snippets').setup(H.mini_snippets_config())
end)

MiniDeps.later(function()
  require('mini.indentscope').setup()
end)

MiniDeps.later(function()
  require('mini.operators').setup()
end)

MiniDeps.later(function()
  require('mini.pairs').setup()
end)

MiniDeps.later(function()
  require('mini.splitjoin').setup()
end)

MiniDeps.later(function()
  require('mini.surround').setup()
end)

MiniDeps.later(function()
  require('mini.bracketed').setup()
end)

MiniDeps.later(function()
  require('mini.diff').setup(H.mini_diff_config())
end)

MiniDeps.now(function()
  require('mini.files').setup {
    content = {
      prefix = function()
        return ''
      end,
    },
    mappings = {
      close = '<C-[>',
      go_in = '<CR>',
      go_in_plus = '<S-CR>',
      go_out = '-',
      go_out_plus = 'H',
    },
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
  }
end)

MiniDeps.later(function()
  require('mini.git').setup()
end)

MiniDeps.later(function()
  require('mini.jump2d').setup()
end)

MiniDeps.later(function()
  require('mini.pick').setup(H.mini_pick_config())
end)

MiniDeps.later(function()
  require('mini.move').setup()
end)

MiniDeps.later(function()
  require('mini.bufremove').setup()
end)

MiniDeps.later(function()
  require('mini.clue').setup(H.mini_clue_config())
end)

MiniDeps.later(function()
  require('mini.keymap').setup()
end)
MiniDeps.later(function()
  H.apply_mini_keymaps()
end)

H.mini_ai_config = function()
  local mini_ai = require('mini.ai')

  local mini_extra = require('mini.extra')

  return {
    custom_textobjects = {
      o = mini_ai.gen_spec.treesitter {
        a = { '@block.outer', '@conditional.outer', '@loop.outer' },
        i = { '@block.inner', '@conditional.inner', '@loop.inner' },
      },

      d = mini_extra.gen_ai_spec.diagnostic(),

      g = mini_extra.gen_ai_spec.buffer(),

      f = mini_ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },

      c = mini_ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },

      -- t should match <x class="flex">*a</x> and <x class="flex"/>
      t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },

      e = {
        { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
        '^().*()$',
      },

      u = mini_ai.gen_spec.function_call(),
      U = mini_ai.gen_spec.function_call { name_pattern = '[%w_]' },
    },
    n_lines = 500,
  }
end

H.mini_statusline_config = function()
  return {
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
        local git = MiniStatusline.section_git { trunc_width = 40 }
        local diff = MiniStatusline.section_diff { trunc_width = 75 }
        local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
        local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
        local filename = MiniStatusline.section_filename { trunc_width = 140 }
        local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
        local location = MiniStatusline.section_location { trunc_width = 75 }
        local search = MiniStatusline.section_searchcount { trunc_width = 75 }

        return MiniStatusline.combine_groups {
          { hl = mode_hl, strings = { mode } },
          { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { '[%n]', filename } },
          '%=', -- End left alignment
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
        }
      end,
    },
    use_icons = false,
  }
end

H.mini_tabline_config = function()
  return {
    show_icons = false,

    format = function(buf_id, label)
      local suffix = vim.bo[buf_id].modified and '+ ' or ''
      return MiniTabline.default_format(buf_id, label) .. suffix
    end,
  }
end

H.mini_pick_config = function()
  return {
    options = {
      content_from_bottom = false,
    },
    source = {
      show = H.pick_show_with_icons,
    },
    window = {
      config = H.window_center,
      prompt_prefix = ' Search: ',
    },
    mappings = {
      toggle_info = '<C-k>',
      toggle_preview = '<C-p>',
      move_down = '<Tab>',
      move_up = '<S-Tab>',
    },
  }
end

H.mini_files_config = function()
  return {
    content = {
      prefix = function()
        return ''
      end,
    },
    mappings = {
      close = '<C-[>',
      go_in = '<CR>',
      go_in_plus = '<S-CR>',
      go_out = '-',
      go_out_plus = 'H',
    },
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
  }
end

H.mini_snippets_config = function()
  local mini_snippets = require('mini.snippets')

  return {
    snippets = {
      mini_snippets.gen_loader.from_lang(),
    },
  }
end

H.mini_completion_config = function()
  return {
    lsp_completion = {
      auto_setup = false,

      source_func = 'omnifunc',

      process_items = function(items, base)
        -- filter 'Text' suggestions
        items = vim.tbl_filter(function(x)
          return x.kind ~= 1
        end, items)
        return MiniCompletion.default_process_items(items, base)
      end,
    },
  }
end

H.mini_clue_config = function()
  local mini_clue = require('mini.clue')

  local config = {
    triggers = {
      -- Leader triggers
      { mode = 'n', keys = '<Leader>' },
      { mode = 'x', keys = '<Leader>' },

      -- Built-in completion
      { mode = 'i', keys = '<C-x>' },

      -- `g` key
      { mode = 'n', keys = 'g' },
      { mode = 'x', keys = 'g' },

      -- Marks
      { mode = 'n', keys = "'" },
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },

      -- Registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },

      -- Window commands
      { mode = 'n', keys = '<C-w>' },

      -- `z` key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },

    clues = {
      mini_clue.gen_clues.builtin_completion(),
      mini_clue.gen_clues.g(),
      mini_clue.gen_clues.marks(),
      mini_clue.gen_clues.registers(),
      mini_clue.gen_clues.windows(),
      mini_clue.gen_clues.z(),

      _G.Mapping.leader_group_clues,
    },
  }

  return config
end

H.mini_diff_config = function()
  local config = {
    view = {
      style = 'sign',

      signs = {
        add = '▌',
        change = '▌',
        delete = '▂',
      },
    },
  }

  return config
end

H.apply_mini_keymaps = function()
  MiniKeymap.map_multistep('i', '<Tab>', { 'pmenu_next', 'minisnippets_next' })
  MiniKeymap.map_multistep(
    'i',
    '<S-Tab>',
    { 'pmenu_prev', 'minisnippets_prev', 'jump_before_tsnode', 'jump_before_open' }
  )
  MiniKeymap.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  MiniKeymap.map_multistep('i', '<BS>', { 'minipairs_bs' })
end

H.apply_mini_completion_autocmds = function()
  local on_attach = function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
  vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })
  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end

H.pick_show_with_icons = function(buf_id, items, query)
  require('mini.pick').default_show(buf_id, items, query, { show_icons = false })
end

H.window_center = function(opt)
  opt = opt or {}
  if vim.o.columns < 80 then
    local h, w = math.ceil(vim.o.lines * 0.5), vim.o.columns
    local r, c = vim.o.lines, 0
    opt.anchor, opt.row, opt.col, opt.height, opt.width = 'SW', r, c, h, w
  else
    local h, w = math.max(10, math.floor(0.4 * vim.o.lines)), 80
    local r, c = math.floor(0.2 * vim.o.lines), math.floor(0.5 * (vim.o.columns - w))
    opt.anchor, opt.row, opt.col, opt.height, opt.width = 'NW', r, c, h, w
  end
  return opt
end
