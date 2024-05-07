return {
    "nvim-lualine/lualine.nvim", name = "lualine",
    dependencies = { "nvim-web-devicons" },
    opts = {
        options = {
            theme = "catppuccin",
            disabled_filetypes = { "NvimTree" }
        },
    }
}
