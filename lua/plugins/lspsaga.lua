return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require('lspsaga').setup({
    lightbulb = {
      enable = false,
      enable_in_insert = false,
    },
    })

    -- show hover doc
    vim.keymap.set("n", "<C-c>h", ":Lspsaga hover_doc<CR>", opt)
    -- rename variable
    vim.keymap.set("n", "<C-c>r", ":Lspsaga rename<CR>", opt)
    -- go to definition
    vim.keymap.set("n", "<C-c>gd", ":Lspsaga goto_definition<CR>", opt)
    -- see references
    vim.keymap.set("n", "<C-c>sr", ":Lspsaga finder<CR>", opt)

    local wk = require('which-key')
    wk.add({
      {"<C-c>h", mode = "n", desc = "Hover document"},
      {"<C-c>r", mode = "n", desc = "Rename variable/file"},
      {"<C-c>gd", mode = "n", desc = "Go to definition"},
      {"<C-c>sr", mode = "n", desc = "See references"},
    })
  end,
  dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons',     -- optional
  }
}
