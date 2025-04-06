local esc         = vim.api.nvim_replace_termcodes('<ESC>', true, true, true)
local command     = vim.api.nvim_create_user_command

local macros_js   = function()
  vim.fn.setreg('l', string.format('yoconsole.log("%spa: ", %spA);%sO%sjviq', esc, esc, esc, esc))
end

local macros_nvim = function()
  vim.fn.setreg('l', string.format('yovim.print("%spa: ", %spA);%sO%sjviq', esc, esc, esc, esc))
end

macros_nvim()
