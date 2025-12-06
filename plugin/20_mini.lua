local H = {}

H.setup_mini_ai = function()
  require('mini.ai').setup(H.mini_ai_config())
end

H.setup_mini_files = function()
  require('mini.files').setup(H.mini_files_config())
end

H.setup_mini_keymap = function()
  require('mini.keymap').setup(H.mini_keymap_config())

  MiniKeymap.map_multistep('i', '<Tab>', { 'pmenu_next', 'minisnippets_next' })
  MiniKeymap.map_multistep(
    'i',
    '<S-Tab>',
    { 'pmenu_prev', 'minisnippets_prev', 'jump_before_tsnode', 'jump_before_open' }
  )
  MiniKeymap.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  MiniKeymap.map_multistep('i', '<BS>', { 'minipairs_bs' })
end

H.setup_mini_statusline = function()
  require('mini.ai').setup(H.mini_ai_config())
end

H.setup_mini_tabline = function()
  require('mini.tabline').setup(H.mini_tabline_config())
end

H.setup_mini_pick = function()
  require('mini.pick').setup(H.mini_pick_config())
end

H.setup_mini_snippets = function()
  require('mini.snippets').setup(H.mini_snippets_config())
end

H.setup_mini_completion = function()
  require('mini.completion').setup(H.mini_completion_config())

  local on_attach = function(args)
    vim.bo[args.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
  vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })
  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end

H.setup_mini_clue = function()
  require('mini.clue').setup(H.mini_clue_config())
end

H.setup_mini_diff = function()
  require('mini.diff').setup(H.mini_diff_config())
end

H.setup_mini_sessions = function()
  require('mini.sessions').setup(H.mini_sessions_config())
end

H.setup_mini_basics = function()
  require('mini.basics').setup(H.mini_basics_config())
end

H.setup_mini_starter = function()
  require('mini.starter').setup(H.mini_starter_config())
end

H.setup_mini_extra = function()
  require('mini.extra').setup(H.mini_extra_config())
end

H.setup_mini_align = function()
  require('mini.align').setup(H.mini_align_config())
end

H.setup_mini_trailspace = function()
  require('mini.trailspace').setup(H.mini_trailspace_config())
end

H.setup_mini_indentscope = function()
  require('mini.indentscope').setup(H.mini_indentscope_config())
end

H.setup_mini_operators = function()
  require('mini.operators').setup(H.mini_operators_config())
end

H.setup_mini_pairs = function()
  require('mini.pairs').setup(H.mini_pairs_config())
end

H.setup_mini_splitjoin = function()
  require('mini.splitjoin').setup(H.mini_splitjoin_config())
end

H.setup_mini_surround = function()
  require('mini.surround').setup(H.mini_surround_config())
end

H.setup_mini_bracketed = function()
  require('mini.bracketed').setup(H.mini_bracketed_config())
end

H.setup_mini_git = function()
  require('mini.git').setup(H.mini_git_config())
end

H.setup_mini_jump2d = function()
  require('mini.jump2d').setup(H.mini_jump2d_config())
end

H.setup_mini_move = function()
  require('mini.move').setup(H.mini_move_config())
end

H.setup_mini_bufremove = function()
  require('mini.bufremove').setup(H.mini_bufremove_config())
end

H.mini_splitjoin_config = function()
  local config = {}
  return config
end

H.mini_indentscope_config = function()
  local config = {}
  return config
end

H.mini_pairs_config = function()
  local config = {}
  return config
end

H.mini_extra_config = function()
  local config = {}
  return config
end

H.mini_git_config = function()
  local config = {}
  return config
end

H.mini_move_config = function()
  local config = {}
  return config
end

H.mini_sessions_config = function()
  local config = {}
  return config
end

H.mini_jump2d_config = function()
  local config = {}
  return config
end

H.mini_bufremove_config = function()
  local config = {}
  return config
end

H.mini_surround_config = function()
  local config = {}
  return config
end

H.mini_bracketed_config = function()
  local config = {}
  return config
end

H.mini_basics_config = function()
  local config = {}
  return config
end

H.mini_starter_config = function()
  local config = {}
  return config
end

H.mini_operators_config = function()
  local config = {}
  return config
end

H.mini_align_config = function()
  local config = {}
  return config
end

H.mini_trailspace_config = function()
  local config = {}
  return config
end

H.mini_ai_config = function()
  local mini_ai = require('mini.ai')

  local mini_extra = require('mini.extra')

  return {
    custom_textobjects = {
      o = mini_ai.gen_spec.treesitter({
        a = { '@block.outer', '@conditional.outer', '@loop.outer' },
        i = { '@block.inner', '@conditional.inner', '@loop.inner' },
      }),

      d = mini_extra.gen_ai_spec.diagnostic(),

      g = mini_extra.gen_ai_spec.buffer(),

      f = mini_ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),

      c = mini_ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),

      -- t should match <x class="flex">*a</x> and <x class="flex"/>
      t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },

      e = {
        { '%u[%l%d]+%f[^%l%d]', '%f[%S][%l%d]+%f[^%l%d]', '%f[%P][%l%d]+%f[^%l%d]', '^[%l%d]+%f[^%l%d]' },
        '^().*()$',
      },

      u = mini_ai.gen_spec.function_call(),
      U = mini_ai.gen_spec.function_call({ name_pattern = '[%w_]' }),
    },
    n_lines = 500,
  }
end

H.mini_statusline_config = function()
  return {
    content = {
      active = function()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
        local git = MiniStatusline.section_git({ trunc_width = 40 })
        local diff = MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
        local filename = MiniStatusline.section_filename({ trunc_width = 140 })
        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local location = MiniStatusline.section_location({ trunc_width = 75 })
        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { '[%n]', filename } },
          '%=', -- End left alignment
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
        })
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
      close = 'q',
      go_in = '<S-CR>',
      go_in_plus = '<CR>',
      go_out = '-',
      go_out_plus = '',
    },
    options = {
      permanent_delete = false,
      use_as_default_explorer = true,
    },
    windows = {
      preview = true,
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

H.mini_keymap_config = function()
  local config = {}
  return config
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

MiniDeps.now(function()
  H.setup_mini_sessions()
end)

MiniDeps.now(function()
  H.setup_mini_basics()
end)

MiniDeps.now(function()
  H.setup_mini_starter()
end)

MiniDeps.now(function()
  H.setup_mini_files()
end)

MiniDeps.later(function()
  H.setup_mini_ai()
end)

MiniDeps.later(function()
  H.setup_mini_statusline()
end)

MiniDeps.later(function()
  H.setup_mini_extra()
end)

MiniDeps.later(function()
  H.setup_mini_tabline()
end)

MiniDeps.later(function()
  H.setup_mini_align()
end)

MiniDeps.later(function()
  H.setup_mini_trailspace()
end)

MiniDeps.later(function()
  H.setup_mini_completion()
end)

MiniDeps.later(function()
  H.setup_mini_snippets()
end)

MiniDeps.later(function()
  H.setup_mini_indentscope()
end)

MiniDeps.later(function()
  H.setup_mini_operators()
end)

MiniDeps.later(function()
  H.setup_mini_pairs()
end)

MiniDeps.later(function()
  H.setup_mini_splitjoin()
end)

MiniDeps.later(function()
  H.setup_mini_surround()
end)

MiniDeps.later(function()
  H.setup_mini_bracketed()
end)

MiniDeps.later(function()
  H.setup_mini_diff()
end)

MiniDeps.later(function()
  H.setup_mini_git()
end)

MiniDeps.later(function()
  H.setup_mini_jump2d()
end)

MiniDeps.later(function()
  H.setup_mini_pick()
end)

MiniDeps.later(function()
  H.setup_mini_move()
end)

MiniDeps.later(function()
  H.setup_mini_bufremove()
end)

MiniDeps.later(function()
  H.setup_mini_clue()
end)

MiniDeps.later(function()
  H.setup_mini_keymap()
end)
