if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end

local hi = function(name, data) vim.api.nvim_set_hl(0, name, data) end

local bg = '#ffffff'
local fg = '#323232'

local grey_bg_light = '#ececec'
local black = '#000000'
local blue = '#1561b8'
local green = '#1C5708'
local light_green = '#dfeacc'
local light_red = '#f2d3cd'
local red = '#c4331d'
local grey = '#5e5e5e'
local light_grey = '#e6e6e6'
local border = '#cccccc'
local highlight = '#eeeeee'
local dark_yellow = '#b37f02'
local yellow = '#f9db70'
local light_yellow = '#f9eab3'
local orange = '#a55000'
local purple = '#5c21a5'
local white = '#ffffff'
local cyan = '#007872'

-- Builtin highlighting groups
-- stylua: ignore start
-- hi('ColorColumn',    { fg=nil,       bg=p.bg_mid2 })
hi('ComplMatchIns',  { fg=nil,       bg=nil })
-- hi('Conceal',        { fg=p.azure,   bg=nil })
hi('CurSearch',      { fg=bg,      bg=yellow })
hi('Cursor',         { fg=bg,      bg=fg })
hi('CursorColumn',   { fg=nil,       bg=p.bg_mid })
hi('CursorIM',       { link='Cursor' })
-- hi('CursorLine',     { fg='#f6f6f6',       bg='#0a82ff' })
-- hi('CursorLineFold', { fg=p.bg_mid2, bg=nil })
-- hi('CursorLineNr',   { fg=p.accent,  bg=nil,       bold=true })
-- hi('CursorLineSign', { fg=p.bg_mid2, bg=nil })
hi('DiffAdd',        { fg=nil,       bg=green })
hi('DiffChange',     { fg=nil,       bg=blue })
hi('DiffDelete',     { fg=nil,       bg=red })
-- hi('DiffText',       { fg=nil,       bg=p.yellow_bg })
hi('Directory',      { fg=blue,   bg=nil })
-- hi('EndOfBuffer',    { fg=p.bg_mid2, bg=nil })
-- hi('ErrorMsg',       { fg=p.red,     bg=nil })
-- hi('FloatBorder',    { fg=p.accent,  bg=p.bg_edge })
hi('FloatTitle',     { fg='#000000',  bg='#f9f9f9', bold=true, blend=0 })
-- hi('FoldColumn',     { fg=p.bg_mid2, bg=nil })
-- hi('Folded',         { fg=p.fg_mid2, bg=p.bg_edge })
-- hi('IncSearch',      { fg=p.bg,      bg=p.yellow })
-- hi('lCursor',        { fg=p.bg,      bg=p.fg })
hi('LineNr',         { fg='#eeeeee', bg=nil })
hi('LineNrAbove',    { link='LineNr' })
hi('LineNrBelow',    { link='LineNr' })
-- hi('MatchParen',     { fg=nil,       bg=p.bg_mid2, bold=true })
-- hi('ModeMsg',        { fg=p.green,   bg=nil })
-- hi('MoreMsg',        { fg=p.azure,   bg=nil })
hi('MsgArea',        { link='Normal' })
-- hi('MsgSeparator',   { fg=p.fg_mid2, bg=p.bg_mid2 })
-- hi('NonText',        { fg=p.bg_mid2, bg=nil })
hi('Normal',        { fg=fg, bg=bg })
hi('NormalFloat',   { fg=fg })
-- hi('NormalNC',      { fg='#' })
hi('Pmenu',         { fg=fg  })
hi('PmenuExtra',    { link='Pmenu' })
hi('PmenuExtraSel', { link='PmenuSel' })
hi('PmenuKind',     { link='Pmenu' })
hi('PmenuKindSel',  { link='PmenuSel' })
-- hi('PmenuMatch',    { fg=text.Primary, bg=nil,  bold=true })
hi('PmenuMatchSel', { fg=nil,       bg=nil,       bold=true,   blend=0  })
hi('PmenuSbar',     { link='Pmenu' })
hi('PmenuSel',      { fg='#f6f6f6', bg='#0a82ff', blend=0 })
hi('PmenuThumb',    { fg=nil, bg='#666666' })
-- hi('Question',       { fg=p.azure,   bg=nil })
-- hi('QuickFixLine',   { fg=nil,       bg=nil,       bold=true })
-- hi('Search',         { fg=p.bg,      bg=p.accent })
-- hi('SignColumn',     { fg=p.bg_mid2, bg=nil })
-- hi('SpecialKey',     { fg=p.bg_mid2, bg=nil })
-- hi('SpellBad',       { fg=nil,       bg=nil,       sp=p.red,    undercurl=true })
-- hi('SpellCap',       { fg=nil,       bg=nil,       sp=p.cyan,   undercurl=true })
-- hi('SpellLocal',     { fg=nil,       bg=nil,       sp=p.yellow, undercurl=true })
-- hi('SpellRare',      { fg=nil,       bg=nil,       sp=p.blue,   undercurl=true })
-- hi('StatusLine',     { fg=text.Primary,  bg=nil })
-- hi('StatusLineNC',   { fg=p.N2,  bg=nil })
-- hi('Substitute',     { fg=p.bg,      bg=p.blue })
-- hi('TabLine',        { fg=p.fg_mid,  bg=p.bg_edge })
hi('TabLineFill',    { link='Tabline' })
-- hi('TabLineSel',     { fg=p.accent,  bg=p.bg_edge })
-- hi('TermCursor',     { fg=nil,       bg=nil,       reverse=true })
-- hi('TermCursorNC',   { fg=nil,       bg=nil,       reverse=true })
-- hi('Title',          { fg=p.accent,  bg=nil })
-- hi('VertSplit',      { fg=p.accent,  bg=nil })
-- hi('Visual',         { fg=nil,       bg=p.bg_mid2 })
-- hi('VisualNOS',      { fg=nil,       bg=p.bg_mid })
-- hi('WarningMsg',     { fg=p.yellow,  bg=nil })
-- hi('Whitespace',     { fg=p.bg_mid2, bg=nil })
hi('WildMenu',       { link='PmenuSel' })
hi('WinBar',         { link='StatusLine' })
hi('WinBarNC',       { link='StatusLineNC' })
-- hi('WinSeparator',   { fg=p.N3,  bg=nil })
-- stylua: ignore end

-- variable '#001080'

-- Standard syntax (affects treesitter)
-- stylua: ignore start
hi('Boolean',        { link = 'Constant' })
hi('Character',      { link = 'Constant' })
hi('Comment',        { fg = '#008000', bg = nil })
hi('Conditional',    { link = 'Statement' })
hi('Constant',       { fg = '#0070c1', bg = nil })
hi('Debug',          { link = 'Special' })
hi('Define',         { link = 'PreProc' })
-- hi('Delimiter',      { fg = p.orange,  bg = nil })
-- hi('Error',          { fg = nil,       bg = p.red_bg })
hi('Exception',      { link = 'Statement' })
hi('Float',          { link = 'Constant' })
hi('Function',       { fg = '#795e26', bg = nil })
hi('Identifier',     { fg = blue,  bg = nil })
hi('Ignore',         { fg = nil,  bg = nil })
hi('Include',        { link = 'PreProc' })
hi('Keyword',        { link = 'Statement' })
hi('Label',          { link = 'Statement' })
hi('Macro',          { link = 'PreProc' })
hi('Number',         { link = 'Constant' })
-- hi('Operator',       { fg = p.fg,      bg = nil })
hi('PreCondit',      { link = 'PreProc' })
-- hi('PreProc',        { fg = p.blue,    bg = nil })
hi('Repeat',         { link = 'Statement' })
-- hi('Special',        { fg = bluer,    bg = nil })
hi('SpecialChar',    { link = 'Special' })
hi('SpecialComment', { link = 'Special' })
hi('Statement',      { fg = '#af00db', bg = nil }) --pink
hi('StorageClass',   { link = 'Type' })
hi('String',         { fg = '#a31515', bg = nil }) --red
hi('Structure',      { link = 'Type' })
hi('Tag',            { link = 'Special' })
-- hi('Todo',           { fg = p.accent,  bg = p.accent_bg, bold = true })
hi('Type',           { fg = '#267f99', bg = nil }) --??
hi('Typedef',        { link = 'Type' })
-- stylua: ignore end

-- hi('MiniJump2dSpot', { fg = p.N4, bg = nil })
-- hi('MiniJump2dSpotUnique', { fg = p.N5, bg = nil })

vim.g.colors_name = 'n00'
