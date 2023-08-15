local helper = require("help")

require("lazy").setup({
    -- Load catppuccin theme
    {
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
            integrations = { nvimtree = true, coc_nvim = true, gitsigns = true }
        },
        config = function() vim.cmd([[colorscheme catppuccin]]) end
    },

    -- Use NvimTree
    { "nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
    {
        "nvim-tree/nvim-tree.lua", name = "nvim-tree",
        dependencies = { "nvim-web-devicons" },
        opts = {
            on_attach = helper.on_attach_nvim_tree,
            view = { width = 30 },
            git = { ignore = false },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
            renderer = {
                group_empty = true,
                highlight_git = true,
                highlight_opened_files = "all",
                icons = { show = { git = true } }
            },
            filters = { custom = { "^.git$" } }
        }
    },

    -- Status line
    {
        "nvim-lualine/lualine.nvim", name = "lualine",
        dependencies = { "nvim-web-devicons" },
        opts = {
            options = {
                theme = "catppuccin",
                disabled_filetypes = { "NvimTree" }
            },
        }
    },

    -- Commentary
    { "numToStr/Comment.nvim", name = "comment", opts = {} },

    -- Git helper
    { "tpope/vim-fugitive", name = "fugitive" },

    -- Gitsign
    {
        "lewis6991/gitsigns.nvim", name = "gitsigns",
        opts = {
            on_attach = helper.on_attach_gitsigns,
            numhl = true
        }
    },

    -- Autocomplete
    { "neoclide/coc.nvim", branch = "release", name = "coc" },

    -- Fuzzy search
    {
        "junegunn/fzf", name = "fzf",
        build = function() vim.fn["fzf#install"]() end
    },
    {
        "junegunn/fzf.vim", name = "fzf.vim",
        dependencies = { "junegunn/fzf" }
    }
}, {
    root = vim.fn.stdpath("data") .. "/site/pack/lazy",
    lockfile = vim.fn.stdpath("data") .. "/site/pack/lazy/lazy-lock.json",
})
