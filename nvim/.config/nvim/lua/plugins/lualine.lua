vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons.git',
  'https://github.com/nvim-lualine/lualine.nvim.git',
}

require('lualine').setup {
  sections = {},
  inactive_sections = {},
  options = { theme = 'auto', component_separators = '', section_separators = '' },
  winbar = {
    lualine_c = {
      { 'filetype', icon_only = true, colored = true, padding = { left = 2, right = 0 } },
      { 'filename', path = 0, padding = { left = 1, right = 1 } },
      {
        function()
          local bufname = vim.api.nvim_buf_get_name(0)
          if bufname == '' then
            return ''
          end
          local relative_path = vim.fn.fnamemodify(bufname, ':~:.')
          local dir_relative = vim.fn.fnamemodify(relative_path, ':h')
          return dir_relative
        end,
        color = 'Comment',
      },
      {
        'diagnostics',
        symbols = { error = '󰅚 ', warn = '󰀪 ', info = '󰋽 ', hint = '󰌶 ' },
      },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      },
      {
        function()
          return '┊  ' .. vim.api.nvim_win_get_number(0)
        end,
        color = 'DevIconWindows',
      },
    },
  },
  inactive_winbar = {
    lualine_c = {
      { 'filetype', icon_only = true, colored = false, padding = { left = 2, right = 0 } },
      { 'filename', path = 0, padding = { left = 1, right = 1 } },
      {
        function()
          local bufname = vim.api.nvim_buf_get_name(0)
          if bufname == '' then
            return ''
          end
          local relative_path = vim.fn.fnamemodify(bufname, ':~:.')
          local dir_relative = vim.fn.fnamemodify(relative_path, ':h')
          return dir_relative
        end,
        color = { fg = '#576D74', bg = '#002C38', gui = 'italic' },
      },
      {
        'diagnostics',
        symbols = { error = '󰅚 ', warn = '󰀪 ', info = '󰋽 ', hint = '󰌶 ' },
        colored = false,
      },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        colored = false,
      },
      {
        function()
          return '┊  ' .. vim.api.nvim_win_get_number(0)
        end,
        color = { fg = '#576D74', bg = '#002C38' },
      },
    },
  },
}
