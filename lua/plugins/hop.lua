return {
  'smoka7/hop.nvim',
  version = "*",
  config = function()
    require("hop").setup({keys = "etovxqpdygfblzhckisuran"})

    vim.keymap.set({'n', 'i'}, "<C-f>f", ":HopWord<CR>", opt)
  end
}
