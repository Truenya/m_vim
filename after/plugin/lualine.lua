require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diagnostics',
        symbols = {error = 'E ', warn = 'W ', info = 'I ', hint = 'H '},
      }
    },
    lualine_c = {'filename'},
    lualine_x = {'vim.fn["codeium#GetStatusString"]()','fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}
