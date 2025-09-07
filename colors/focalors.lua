if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end

if vim.o.background == 'light' then
  require('mini.hues').setup {
    background = '#f8f9fe',
    foreground = '#1a1f68',
    n_hues = 3,
  }
else
  require('mini.hues').setup {
    background = '#1a1f68',
    foreground = '#f8f9fe',
    saturation = 'high',
    n_hues = 3,
  }
end

vim.g.colors_name = 'focalors'
