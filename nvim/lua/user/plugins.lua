local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = get_setup("telescope"),
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "dcampos/cmp-snippy",
    },
    config = get_setup("cmp"),
  })

  -- LuaLine
  use({
    "nvim-lualine/lualine.nvim",
    config = get_setup("lualine"),
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })

  --use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })

--  use({
--    "numToStr/Comment.nvim",
--    opt = true,
--    keys = { "gc", "gcc" },
--    config = get_setup("comment"),
--  })

  -- code snippet
--  use({ "tpope/vim-repeat" })
--  use({ "tpope/vim-surround" })
  use({ "honza/vim-snippets" })
  use({ "dcampos/nvim-snippy", config = get_setup("snippy") })

  --
  -- colorscheme
  --
  use({ "EdenEast/nightfox.nvim", config = get_setup("nightfox") })
  use({ "kyazdani42/nvim-web-devicons" })
--  use({
--    "nvim-treesitter/nvim-treesitter",
--    config = get_setup("treesitter"),
--    run = ":TSUpdate",
--  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
