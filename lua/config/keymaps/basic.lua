-- set keymps
keymap.set("i", "jk", "<Esc>", opt)
keymap.set("n", "<Leader>sa", ":wa<CR>", opt)
keymap.set("n", "<Leader>q", ":qa<CR>", opt)

-- buffer close
keymap.set("n", "bc", ":BufferClose!<CR>", opt)

-- docs
local wk = require('which-key')
wk.add({
  {"jk", mode = "i", desc = "Escape"},
  {"<Leader>sa", mode = "n", desc = "Save all"},
  {"<Leader>q", mode = "n", desc = "Quit all"},
})



