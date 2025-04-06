require 'config.options'
require 'config.autocmd'
require 'config.keymaps'
require 'config.macros'
require 'config.lazy'

---@diagnostic disable-next-line: undefined-field
require('lazy').setup {
  change_detection = { notify = false },
  { import = 'custom/plugins' },
  { import = 'config/plugins' },
}
