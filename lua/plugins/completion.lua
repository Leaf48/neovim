local servers = {
  "lua_ls",
  "bashls",
  "cssls",
  "dockerls",
  "docker_compose_language_service",
  "html",
  "jsonls",
  "ts_ls",
  "rust_analyzer",
  "pyright",
  "pylsp",
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers
      })
    end
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.3.0",
  },
  {
    "saadparwaiz1/cmp_luasnip"
  },
  {
    "hrsh7th/cmp-path"
  },
  {
    "hrsh7th/cmp-buffer"
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-h>'] = cmp.mapping.complete(),
          ['<C-n>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = 'nvim_lsp'},
          { name = 'luasnip' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        })
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
    --   -- You will likely want to reduce updatetime which affects CursorHold
    --   -- note: this setting is global and should be set only once
      vim.o.updatetime = 250
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
        callback = function ()
          vim.diagnostic.open_float(nil, {focus=false})
        end
      })
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      local lspconfig = require('lspconfig')

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

    end
  },
}
