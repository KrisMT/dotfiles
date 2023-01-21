return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true
        },
        autotag = {
          enable = true,
          filetypes = {
            "html",
            "javascript",
            "typescript",
            "markdown",
            "c",
            "latex",
            "lua",
            "rust",
          },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<TAB>",
          },
        },
      })
    end,
  },
}

