local keyset = vim.keymap.set

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Helper functions
local helper = require("help")

-- COCS
-- Make <CR> to accept selected completion item or notify coc.nvim to format
keyset("i", "<TAB>", [[coc#pum#visible() ? coc#pum#confirm() : "<TAB>"]], opts)

-- NvimTree
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = helper.open_nvim_tree })
keyset("n", "<Leader>t", helper.toggle_nvim_tree)

-- Fzf
keyset("n", "<Leader>s", require("fzf-lua").grep_project)
keyset("n", "<Leader>b", require("fzf-lua").buffers)
