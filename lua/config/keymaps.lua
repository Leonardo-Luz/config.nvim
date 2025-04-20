local set = vim.keymap.set

set('n', '<Esc>', '<cmd>nohlsearch<CR>')
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('v', '<leader>c', function()
  -- Get the start and end positions of the visual selection
  local start_pos = vim.fn.getpos("v") -- Start of visual selection
  local end_pos = vim.fn.getpos(".")   -- End of visual selection (cursor position)

  -- Get the selected text from the current line (assuming single-line selection)
  local line = vim.fn.getline(start_pos[2])
  local selected_text = line:sub(start_pos[3], end_pos[3])

  -- Perform calculation on the selected text (example: evaluate as a Lua expression)
  local success, result = pcall(vim.fn.eval, selected_text)
  if not success then
    -- If evaluation fails, fall back to the original selected text
    result = selected_text
  end

  -- Split the line into the part before the selection, the selected part, and the part after the selection
  local before = line:sub(1, start_pos[3] - 1)
  local after = line:sub(end_pos[3] + 1)

  -- Combine the parts with the new calculated value
  local new_line = before .. string.format("%.1f", result) .. after

  -- Set the modified line back into the buffer
  vim.api.nvim_buf_set_lines(0, start_pos[2] - 1, start_pos[2], false, { new_line })
  vim.api.nvim_input('<Esc>')
  vim.api.nvim_win_set_cursor(0, { start_pos[2], start_pos[3] - 1 })
end, { desc = '[C]alculate' })
