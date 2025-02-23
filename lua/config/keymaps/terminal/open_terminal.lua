-- open terminal and create new terminal if not exist
local function open_terminal()
  local term_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local bufnr = vim.api.nvim_win_get_buf(win)
    if vim.bo[bufnr].buftype == "terminal" then
      term_win = win
      break
    end
  end

  if term_win then
    -- go to terminal if exist
    vim.api.nvim_set_current_win(term_win)
  else
    -- create terminal and resize terminal
    vim.cmd("bel terminal")
    vim.cmd("resize 5")
  end

  -- start insert-mode
  vim.cmd("startinsert")

end

-- start terminal
vim.keymap.set("n", "<Leader>/", open_terminal, { noremap = true, silent = true })

-- back to other tab from terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><C-w>w', { noremap = true, silent = true })
