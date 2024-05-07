return {
    "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {
        flavour = "mocha",
        compile = {
            enabled = false,
            path = vim.fn.stdpath "cache" .. "/catppuccin"
        },
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        integrations = { nvimtree = true, treesitter = true, gitsigns = true }
    },
    config = function() vim.cmd([[colorscheme catppuccin]]) end
} 
