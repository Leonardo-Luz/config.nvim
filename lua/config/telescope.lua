require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      'ignore_*',
      'node_modules',
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
}

local set = vim.keymap.set

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'
set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

set('n', '<leader>s/', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = '[S]earch [/] in Open Files' })

set('n', '<leader>so', function()
  builtin.find_files { hidden = true }
end, { desc = '[S]earch [O]occult files' })

set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

set('n', '<leader>st', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' .. '/../wezterm/' }
end, { desc = '[S]earch [T]erminal files' })
