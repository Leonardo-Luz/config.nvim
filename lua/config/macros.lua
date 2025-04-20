local esc          = vim.api.nvim_replace_termcodes('<ESC>', true, true, true)
local command      = vim.api.nvim_create_user_command

local macros_js    = function()
  local js_log = string.format('yoconsole.log("%spa: ", %spA);%sO%sjviq', esc, esc, esc, esc)
  vim.fn.setreg('l', js_log)
end

local macros_nvim  = function()
  local lua_log = string.format('yovim.print("%spa: ", %spA);%sO%sjviq', esc, esc, esc, esc)

  vim.fn.setreg('l', lua_log)
end

local macros_latex = function()
  local latex_fix = string.format('S{lxh%%hx%%i\\fixme%s', esc)

  vim.fn.setreg('l', latex_fix)
end

macros_latex()
