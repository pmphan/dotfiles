return {
    { "numToStr/Comment.nvim", name = "comment" },
    {
        "dhruvasagar/vim-table-mode", name = "table-mode",
        init = function()
            vim.g.table_mode_map_prefix = "<LocalLeader>t"
        end
    },
    { "3rd/image.nvim", name = "image", dependencies = { "luarocks", "treesitter" }, config = true }
}
