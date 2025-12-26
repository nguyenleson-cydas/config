vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua.git' }

-- accept = '<M-l>',
-- accept_word = false,
-- accept_line = false,
-- next = '<M-]>',
-- prev = '<M-[>',
-- dismiss = '<C-]>',
require('copilot').setup {
  suggestion = {
    auto_trigger = true,
  },
}
