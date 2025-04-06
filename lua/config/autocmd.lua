local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('BufEnter', {
  pattern = '*.md',
  desc = 'Highlight a custom markdown block',
  group = augroup('markdown-custom-block', { clear = true }),
  callback = function()
    vim.cmd("source" .. vim.fn.stdpath('config') .. "/syntax/markdown.vim")
  end,
})
