return {
  "tkmpypy/chowcho.nvim",
  config = function()
    require("chowcho").setup({})

    vim.keymap.set("n", "<Leader>c", ":Chowcho<CR>", opt)
  end,
}
