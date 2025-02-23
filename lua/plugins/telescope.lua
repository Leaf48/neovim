return {
  'nvim-telescope/telescope.nvim', tag='0.1.8',
  dependencies={'nvim-lua/plenary.nvim'},
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup{
      defaults = {
        mappings = {
          i = {  -- mappings for insert mode in Telescope prompt
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    }
  end,
  keys={
    {
      '<Leader>f',
      function() require("telescope.builtin").find_files() end,
    },
    {
      '<Leader>g',
      function() require("telescope.builtin").live_grep() end,
    }
  },
}

