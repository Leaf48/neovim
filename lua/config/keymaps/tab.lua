-- close current tab
keymap.set("n", "<S-t>q", ":q<CR>", opt)

-- split tab
keymap.set("n", "<S-t>|", ":vs<CR>", opt)
keymap.set("n", "<S-t>-", ":sp<CR>", opt)

-- Switch among active tabs
vim.keymap.set("n", "<S-h>", "<C-w>h", opt)
vim.keymap.set("n", "<S-l>", "<C-w>l", opt)
vim.keymap.set("n", "<S-j>", "<C-w>j", opt)
vim.keymap.set("n", "<S-k>", "<C-w>k", opt)

-- Adjust tab size
keymap.set("n", "<S-t><Right>",  ":vertical resize -5<CR>", opt)
keymap.set("n", "<S-t><Left>", ":vertical resize +5<CR>", opt)
keymap.set("n", "<S-t><Down>",    ":resize +5<CR>", opt)
keymap.set("n", "<S-t><Up>",  ":resize -5<CR>", opt)
