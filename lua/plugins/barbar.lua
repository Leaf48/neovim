return {
  "romgrk/barbar.nvim",
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup()

    vim.keymap.set("n", "<C-,>", ":BufferPrevious<CR>", opt)
    vim.keymap.set("n", "<C-.>", ":BufferNext<CR>", opt)
    vim.keymap.set("n", "<C-/>", ":BufferClose<CR>", opt)

  end
}
