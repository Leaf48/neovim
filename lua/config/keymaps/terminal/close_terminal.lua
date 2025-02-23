
-- close tabs
local function get_terminal_tabs()
  local terminal_tabs = {}
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_win_get_buf(current_win)

  -- if current window is terminal then insert first
  if vim.bo[current_buf].buftype == "terminal" then
    table.insert(terminal_tabs, current_win)
  end

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= current_win then
      local bufnr = vim.api.nvim_win_get_buf(win)
      if vim.bo[bufnr].buftype == "terminal" then
        table.insert(terminal_tabs, win)
      end
    end
  end

  return terminal_tabs
end

local function close_specific_tab(tab, force)
   vim.api.nvim_win_close(tab, force)
end

local function show_terminal_numbers()
  local terminal_tabs = get_terminal_tabs()
  local floating_windows = {}

  for i, win in ipairs(terminal_tabs) do
    local pos = vim.api.nvim_win_get_position(win)

    local row = pos[1]
    local col = pos[2]

    -- 表示用の一時バッファを作成
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { tostring(i) })
    local opts = {
      relative = "editor",
      row = row,
      col = col,
      width = 3,
      height = 1,
      style = "minimal",
      focusable = false,
      border = "none",
    }

    local float_win = vim.api.nvim_open_win(buf, false, opts)
    vim.api.nvim_win_set_option(float_win, "winhighlight", "Normal:TerminalNumberColor")

    table.insert(floating_windows, float_win)
  end

  -- 1秒後に浮動ウィンドウを全て閉じる
  vim.defer_fn(function()
    for _, float_win in ipairs(floating_windows) do
      if vim.api.nvim_win_is_valid(float_win) then
        vim.api.nvim_win_close(float_win, true)
      end
    end
  end, 1500)

  return terminal_tabs
end

-- key binding
vim.keymap.set("n", "<C-t>", function()
  local terminal_tabs = show_terminal_numbers()
  vim.cmd("redraw")

  local char = vim.fn.getchar()

  local key = vim.fn.nr2char(char)
  local num = tonumber(key)

  if num then
    if 0 < num and num <= #terminal_tabs then
      close_specific_tab(terminal_tabs[num])
    else
      vim.notify("Invalid tab number", vim.log.ERROR)
    end
  end
end, opt)
