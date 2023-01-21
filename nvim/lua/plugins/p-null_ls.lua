return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.completion.spell,

          -- Clang
          null_ls.builtins.formatting.clang_format,
          -- Latex
          null_ls.builtins.diagnostics.chktex,
          null_ls.builtins.formatting.latexindent,
        },
      })
    end
  },
}
