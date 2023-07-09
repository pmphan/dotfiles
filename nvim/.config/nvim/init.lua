--[[ init.lua ]]

-- This line makes pacman-installed global Arch Linux vim packages work.
vim.cmd.source "/usr/share/nvim/archlinux.vim"

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
-- vim.g.localleader = "\\"

-- IMPORTS
-- require('vars')      -- Variables
require('opts')         -- Options
require('plug')         -- Plugins
require('keys')         -- Keymaps
