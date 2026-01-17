-- Set <Space> as the leader key before anything else
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load options (line numbers, etc)
require("config.options")

-- Load global keymaps
require("config.keymaps")

-- Setup Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Tell Lazy to look for plugins in the 'lua/plugins' folder
require("lazy").setup("plugins")
