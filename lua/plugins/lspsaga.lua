return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require('lspsaga').setup({
      ui = {
        enable = false,
        sign = false
      }
    })

    -- show hover doc
    vim.keymap.set("n", "hd", ":Lspsaga hover_doc<CR>", opt)
    -- rename variable
    vim.keymap.set("n", "R", ":Lspsaga rename<CR>", opt)
    -- go to definition
    vim.keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", opt)

    local wk = require('which-key')
    wk.add({
      {"hd", mode = "n", desc = "Hover document"},
      {"R", mode = "n", desc = "Rename variable/file"},
      {"gd", mode = "n", desc = "Go to definition"},
    })

  end,
  dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
  }
}
