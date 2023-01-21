return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = { "sumneko_lua", "rust_analyzer", "clangd" },
      }

      local on_attach = function(_, _)
        local wk = require("which-key")

        wk.register({
          ["<leader>rn"] = { vim.lsp.buf.rename, "LSP Buffer Rename" },
          ["<leader>ca"] = { vim.lsp.buf.code_action, "LSP Code Action" },
          --
          ["gd"] = { vim.lsp.buf.definition, "LSP Definition" },
          ["gi"] = { vim.lsp.buf.implementation, "LSP implementation" },
          ["gr"] = { require("telescope.builtin").lsp_references, "LSP Telescope" },
          ["K"] = { vim.lsp.buf.hover, "LSP Hover" },
        },{
          mode = "n",
          silent = true,
        })
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("lspconfig").sumneko_lua.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      require("lspconfig").clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,
  },
}
