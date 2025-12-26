vim.pack.add {
  'https://github.com/nvim-tree/nvim-web-devicons.git',
  'https://github.com/b0o/incline.nvim',
}

local devicons = require 'nvim-web-devicons'

require('incline').setup {
  window = { placement = { vertical = 'top', horizontal = 'left' }, width = 'fill' },
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local filename = vim.fn.fnamemodify(bufname, ':t')
    if filename == '' then
      filename = '[No Name]'
    end

    local ft_icon, ft_color = devicons.get_icon_color(filename)

    local function build_path_label()
      if bufname == '' then
        return nil
      end

      local dir_abs = vim.fn.fnamemodify(bufname, ':p:h') -- directory part (absolute)
      local shortened = vim.fn.pathshorten(dir_abs)
      local label = (shortened ~= '' and shortened) or dir_abs
      return label
    end

    local function get_git_diff()
      local icons = { removed = ' ', changed = ' ', added = ' ' }
      local signs = vim.b[props.buf].gitsigns_status_dict
      local labels = {}
      if signs == nil then
        return labels
      end
      for name, icon in pairs(icons) do
        if tonumber(signs[name]) and signs[name] > 0 then
          table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
        end
      end
      return labels
    end

    local function get_diagnostic_label()
      local icons = {
        error = '󰅚 ',
        warn = '󰀪 ',
        info = '󰋽 ',
        hint = '󰌶 ',
      }
      local label = {}
      for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
          table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
        end
      end
      return label
    end

    local path_label = build_path_label()
    local is_modified = vim.bo[props.buf].modified

    local diagnostic_labels = get_diagnostic_label()
    local git_diff_labels = get_git_diff()
    local has_diagnostics = #diagnostic_labels > 0
    local has_git_diff = #git_diff_labels > 0

    local result = {}
    table.insert(result, { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' })
    table.insert(result, { filename, gui = is_modified and 'bold,italic' or 'bold' })
    if path_label then
      table.insert(result, { '  ', path_label, group = 'Comment' })
      if has_diagnostics or has_git_diff then
        table.insert(result, { ' ┊ ' })
      end
    end

    for _, label in ipairs(diagnostic_labels) do
      table.insert(result, label)
    end
    if has_git_diff and has_diagnostics then
      table.insert(result, { '┊ ' })
    end
    for _, label in ipairs(git_diff_labels) do
      table.insert(result, label)
    end

    table.insert(result, { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' })

    return result
  end,
}
