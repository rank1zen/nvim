if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end

require('mini.base16').setup {
  palette = {
    base00 = '#ffffff',
    base01 = '#f6f5f4',
    base02 = '#deddda',
    base03 = '#c0bfbc',
    base04 = '#5e5c64',
    base05 = '#3d3846',
    base06 = '#241f31',
    base07 = '#000000',
    base08 = '#c01c28',
    base09 = '#241f31',
    base0A = '#241f31',
    base0B = '#1b8553',
    base0C = '#1c71d8',
    base0D = '#241f31',
    base0E = '#241f31',
    base0F = '#9c6e03',
  },
  use_cterm = true,
  plugins = {
    default = false,
    ['echasnovski/mini.nvim'] = true,
  },
}

vim.g.colors_name = 'n01'
