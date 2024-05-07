--[[ init.lua ]]

-- This line makes pacman-installed global Arch Linux vim packages work.
vim.cmd.source "/usr/share/nvim/archlinux.vim"

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.maplocalleader = " "

require("lazy").setup("plugins", {
    root = vim.fn.stdpath("data") .. "/site/pack/lazy",
    lockfile = vim.fn.stdpath("data") .. "/site/pack/lazy/lazy-lock.json"
})
require("opts")
require("keys")

