-- Search in Range
function _G.VSearch(search_term)
  -- Save the current visual selection
  local start = vim.fn.getpos("'<")
  local end_ = vim.fn.getpos("'>")
  -- Clear the visual selection
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gv", true, false, true), 'n', true)
  -- Perform the search within the saved range
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("gvy", true, false, true), 'n', true)
  local pattern = '\\%V' .. vim.fn.escape(search_term, '\\')
  vim.fn.setpos("'<", start)
  vim.fn.setpos("'>", end_)
  vim.cmd('/' .. pattern)
end

vim.keymap.set("v", "<leader>sr", ":<C-u>lua VSearch(vim.fn.input('Search in Range: '))<CR>", { desc = '[S]earch in [R]ange' })
