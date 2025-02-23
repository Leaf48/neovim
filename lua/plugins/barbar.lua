return {
  "romgrk/barbar.nvim",
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup()

    vim.keymap.set("n", "<S-j>", ":BufferPrevious<CR>", opt)
    vim.keymap.set("n", "<S-k>", ":BufferNext<CR>", opt)
    vim.keymap.set("n", "<S-q>", ":BufferClose<CR>", opt)

    -- Switch active tab
    vim.keymap.set("n", "<S-h>", "<C-w>h", opt)
    vim.keymap.set("n", "<S-l>", "<C-w>l", opt)
  end
}
