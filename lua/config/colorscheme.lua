--- 'quiet'|'unokai'|'solarized-osaka'
vim.cmd.colorscheme 'solarized-osaka'

--- Remove background of colorschemes
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  pattern = "*",
  callback = function()
    local remove_background = {
      'unokai',
      'quiet',
    }

    for _, colorscheme in pairs(remove_background) do
      if vim.g["colors_name"] == colorscheme then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatTitle", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatFooter", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
      end
    end
  end
})
