-- [[ keys.lua ]]

local keyset = vim.keymap.set

-- [[ fzf ]]
keyset("n", "<Leader>s", require("fzf-lua").grep_project)
keyset("n", "<Leader>b", require("fzf-lua").buffers)

-- [[ nvim-tree ]]
keyset("n", "<Leader>t", require("nvim-tree.api").tree.toggle)
