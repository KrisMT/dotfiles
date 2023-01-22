-- options for neovim
require("user.options")

-- Add Lazy package management
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Keymap for use
vim.g.mapleader = ' ' -- leader key is spacebar
vim.keymap.set({"n", "v"}, "<C-b>", "<NOP>", { noremap = true }) -- unmapping <C-b> to NOP for tmux

-- setup plugins
require("lazy").setup("plugins")
