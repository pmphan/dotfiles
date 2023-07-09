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
        	integrations = { nvimtree = true, coc_nvim = true }
        },
        config = function() vim.cmd([[colorscheme catppuccin]]) end
    },

    -- Use NvimTree
    { "nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
    {
        "nvim-tree/nvim-tree.lua", name = "nvim-tree",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            on_attach = helper.on_attach_nvim_tree,
        	view = { width = 30 },
        	git = { ignore = false },
        	renderer = {
        		group_empty = true,
        		highlight_git = true,
        		highlight_opened_files = "all",
        		icons = { show = { git = true } }
    	    },
            filters = { custom = { "^.git$" } }
        }
    },

    -- Feline
    { "feline-nvim/feline.nvim", name = "feline" },

    -- Git
    { "tpope/vim-fugitive", name = "fugitive" },

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

require("feline").setup{
    components = require('catppuccin.groups.integrations.feline').get()
}
