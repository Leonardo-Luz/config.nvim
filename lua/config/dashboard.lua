local dashboard = require 'dashboard'

local current_header = 'bloody'

local current_setup = 'doom'

local headers = {
  cards = {
    '.------..------..------.',
    '|L.--. ||U.--. ||Z.--. |',
    '| :/\\: || (\\/) || :(): |',
    '| (__) || :\\/: || ()() |',
    "| '--'L|| '--'U|| '--'Z|",
    "`------'`------'`------'",
    '                        ',
    '                        ',
  },
  diam = {
    ' ▗▖█  ▐▌▄▄▄▄▄ ',
    ' ▐▌▀▄▄▞▘ ▄▄▄▀ ',
    ' ▐▌     █▄▄▄▄ ',
    ' ▐▙▄▄▖        ',
    '              ',
    '              ',
  },
  bloody = {
    '▓██▓     ██   ██ ▒███████▒',
    '▒██▒     ██  ▓██▒▒▒  ▒▄█▀░',
    '▒██░    ▓██  ▒██░░░ ▄█▀░  ',
    '▒██░    ▓██  ░██░ ▄█▀░   ░',
    '░██████▒▒▒█████▓ ▒███████▒',
    '░ ▒░▓  ░░▒▓▒ ▒ ▒ ░▒▒ ▓░▒░▒',
    '  ░ ▒   ░░▒░ ░ ░ ░░▒ ▒ ░ ▒',
    '  ░ ░    ░░░   ░ ░ ░ ░   ░',
    '    ░  ░   ░       ░      ',
    '                 ░        ',
    '                          ',
  },
}

---@param num number|nil
---@return table
local function get_quotes(num)
  local quotes = {
    {
      ' ',
      'The only way to do great work is to love what you do.',
      "If you haven't found it yet, keep looking. Don't settle.",
      '- Steve Jobs',
    },
    { ' ', 'Be the change that you wish to see in the world.',                                          (" "):rep(22) .. '- Mahatma Gandhi' },
    { ' ', 'The journey of a thousand miles begins with a single step.',                                (" "):rep(22) .. '- Lao Tzu' },
    { ' ', "Believe you can and you're halfway there.",                                                 (" "):rep(22) .. '- Theodore Roosevelt' },
    { ' ', 'The only limit to our realization of tomorrow will be our doubts of today.',                (" "):rep(22) .. '- Franklin D. Roosevelt' },
    { ' ', 'Keep your face always toward the sunshine, and shadows will fall behind you.',              (" "):rep(22) .. '- Walt Whitman' },
    { ' ', 'Not how long, but how well you have lived is the main thing.',                              (" "):rep(22) .. '- Seneca' },
    { ' ', "Life is what happens when you're busy making other plans.",                                 (" "):rep(22) .. '- John Lennon' },
    { ' ', 'Happiness is not something ready made. It comes from your own actions.',                    (" "):rep(22) .. '- Dalai Lama' },
    { ' ', 'Challenges are what make life interesting. Overcoming them is what makes life meaningful.', (" "):rep(22) .. '- Joshua Marine' },
  }

  return quotes[num or math.random(#quotes)]
end

local function item(desc, key, action)
  return {
    icon = '* ',
    icon_hl = '@markup.strong',
    desc = desc,
    desc_hl = '@markup.strong',
    key = key,
    key_hl = '@markup.strong',
    key_format = ' [%s]',
    action = action,
  }
end

local function opts(theme, header)
  if theme == 'doom' then
    return {
      theme = 'doom',
      config = {
        header = headers[header] or {},
        disable_move = true,
        center = {
          item("Update", "u", "Lazy update"),
          item("Files", "f", "Telescope find_files"),
          item("Nvim config", "n", 'Telescope find_files cwd=' .. vim.fn.stdpath 'config'),
          item("Telescope", "t", 'Telescope'),
        },
        vertical_center = true,
        footer = get_quotes(),
      },
    }
  elseif theme == 'hyper' then
    return {
      theme = 'hyper',
      disable_move = true,
      config = {
        header = headers[header] or {},
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Nvim config',
            group = 'Number',
            action = 'Telescope find_files cwd=' .. vim.fn.stdpath 'config',
            key = 'd',
          },
        },
        packages = { enable = true },
        project = { enable = true, limit = 4, icon = '*', label = ' Recent Projects', action = 'Telescope find_files cwd=' },
        mru = { enable = true, limit = 4, icon = '*', label = ' Recent Files', cwd_only = false },
        footer = get_quotes(),
      },
    }
  end
  return {}
end

local function new_quote()
  local quotes = table.concat(get_quotes(), " ")
  vim.cmd("DashboardUpdateFooter " .. quotes)
end

vim.api.nvim_create_user_command("DashboardQuote", function()
  new_quote()
end, {})

dashboard.setup(opts(current_setup, current_header))
