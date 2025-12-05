if vim.g.colors_name ~= nil then vim.cmd('highlight clear') end

if vim.o.background == 'light' then
  require('mini.hues').setup {
    background = '#ffffff',
    foreground = '#202122',
    saturation = 'high',
    n_hues = 3,
}
else
  require('mini.hues').setup {
    background = '#202122',
    foreground = '#ffffff',
    saturation = 'high',
    n_hues = 3,
  }
end

vim.g.colors_name = 'wite'
