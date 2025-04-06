local time = require 'time'
local dashboard = require 'dashboard'
local asciis = {}

pcall(function()
  asciis = require 'custom.dashboard'
end)

local current_header = 'leovim'
local current_setup = 'doom'

local headers = {
  cards = {
    '.------..------..------.',
    '|L.--. ||U.--. ||Z.--. |',
    '| :/\\: || (\\/) || :(): |',
    '| (__) || :\\/: || ()() |',
    "| '--'L|| '--'U|| '--'Z|",
    "`------'`------'`------'",
  },
  diam = {
    ' ▗▖█  ▐▌▄▄▄▄▄ ',
    ' ▐▌▀▄▄▞▘ ▄▄▄▀ ',
    ' ▐▌     █▄▄▄▄ ',
    ' ▐▙▄▄▖        ',
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
  },
  leovim = {
    "██╗     ███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
    "██║     ██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
    "██║     █████╗  ██║   ██║██║   ██║██║██╔████╔██║",
    "██║     ██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
    "███████╗███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
    "╚══════╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
  },
  leovim_dos = {
    " █████                                      ███                 ",
    "░░███                                      ░░░                  ",
    " ░███         ██████   ██████  █████ █████ ████  █████████████  ",
    " ░███        ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ",
    " ░███       ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ",
    " ░███      █░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ",
    " ███████████░░██████ ░░██████   ░░█████    █████ █████░███ █████",
    "░░░░░░░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ",
  },
}

for key, ascii in pairs(asciis) do
  headers[key] = ascii
end

local lenght = 0

for _, value in pairs(headers) do
  if #value > lenght then
    lenght = #value
  end
end

---@param num number|nil
---@return table
local function get_quotes(num)
  local quotes = {
    {
      ' ',
      '\"The only way to do great work is to love what you do.',
      "If you haven't found it yet, keep looking. Don't settle.\"",
      '- Steve Jobs',
    },
    { ' ', '\"Be the change that you wish to see in the world.\"',                                          (" "):rep(22) .. '- Mahatma Gandhi' },
    { ' ', '\"The journey of a thousand miles begins with a single step.\"',                                (" "):rep(22) .. '- Lao Tzu' },
    { ' ', "\"Believe you can and you're halfway there.\"",                                                 (" "):rep(22) .. '- Theodore Roosevelt' },
    { ' ', '\"The only limit to our realization of tomorrow will be our doubts of today.\"',                (" "):rep(22) .. '- Franklin D. Roosevelt' },
    { ' ', '\"Keep your face always toward the sunshine, and shadows will fall behind you.\"',              (" "):rep(22) .. '- Walt Whitman' },
    { ' ', '\"Not how long, but how well you have lived is the main thing.\"',                              (" "):rep(22) .. '- Seneca' },
    { ' ', "\"Life is what happens when you're busy making other plans.\"",                                 (" "):rep(22) .. '- John Lennon' },
    { ' ', '\"Happiness is not something ready made. It comes from your own actions.\"',                    (" "):rep(22) .. '- Dalai Lama' },
    { ' ', '\"Challenges are what make life interesting. Overcoming them is what makes life meaningful.\"', (" "):rep(22) .. '- Joshua Marine' },
  }

  local quote = {}

  for _, line in pairs(quotes[num or math.random(#quotes)]) do
    table.insert(quote, line)
  end

  for _ = 1, (10 + 4) - #quote - math.floor((#headers[current_header] or 0) / 2) do
    table.insert(quote, ' ')
  end

  return quote
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

local function set_header(header)
  local _header = {}

  for _ = 1, ((7 + math.floor(lenght / 2)) - (math.floor(#header / 2))) do
    table.insert(_header, ' ')
  end

  for _, line in pairs(headers[header] or {}) do
    table.insert(_header, line)
  end

  table.insert(_header, ' ')
  time.update_time()
  table.insert(_header, time.formated_time())

  for _ = 1, ((math.floor(lenght / 2)) - (math.floor(#header / 2))) do
    table.insert(_header, ' ')
  end

  return _header
end

local function opts(theme, header)
  local _header = set_header(header)

  if theme == 'doom' then
    return {
      theme = 'doom',
      disable_move = false,
      config = {
        header = _header,
        disable_move = false,
        center = {
          item("Update", "u", "Lazy update"),
          item("Edit New File", "e", 'enew'),
          item("Files", "f", "Telescope find_files"),
          item("Nvim config", "n", 'Telescope find_files cwd=' .. vim.fn.stdpath 'config'),
          item("Telescope", "t", 'Telescope'),
        },
        hide = {},
        preview = {},
        vertical_center = true,
        footer = get_quotes(),
      },
    }
  elseif theme == 'hyper' then
    return {
      theme = 'hyper',
      disable_move = true,
      config = {
        header = _header,
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
  dashboard:get_opts(function(obj)
    obj.config.header = set_header(current_header)
    obj.config.footer = get_quotes()

    dashboard:load_theme(obj)
  end)
end

vim.api.nvim_create_user_command("DashboardQuote", function()
  new_quote()
end, {})

dashboard.setup(opts(current_setup, current_header))
