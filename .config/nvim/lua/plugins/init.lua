return {
    "folke/which-key.nvim",
    { "catppuccin/nvim", lazy = true, name = "catppuccin", priority=1000 },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    { "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
      },
      config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        require('mason').setup()
        local mason_lspconfig = require 'mason-lspconfig'
        mason_lspconfig.setup {
            ensure_installed = { "pyright" }
        }
        require("lspconfig").pyright.setup {
            capabilities = capabilities,
        }
      end
    },
}
