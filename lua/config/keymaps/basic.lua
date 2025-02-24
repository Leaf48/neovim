-- set keymps
keymap.set("i", "jk", "<Esc>", opt)
keymap.set("n", "<Leader>sa", ":wa<CR>", opt)
keymap.set("n", "<Leader>q", ":qa<CR>", opt)

-- tab management
keymap.set("n", "<C-t>q", ":q<CR>", opt)

-- split tab
keymap.set("n", "<C-t>|", ":vs<CR>", opt)

-- docs
local wk = require('which-key')
wk.add({
  {"jk", mode = "i", desc = "Escape"},
  {"<Leader>sa", mode = "n", desc = "Save all"},
  {"<Leader>q", mode = "n", desc = "Quit all"},
})


