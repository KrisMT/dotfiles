return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "BurntSushi/ripgrep",
    },
    config = function()
      require('telescope').setup{
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          }
        }
      }

      require("telescope").load_extension("fzy_native")
    end,
  },
}
