return {
    "nvim-treesitter/nvim-treesitter", name = "treesitter", build = ":TSUpdate",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "c", "cpp", "lua", "ini", "vim", "vimdoc", "query", "python", "bash", "asm", "markdown", "norg", "disassembly"
        },
        highlight = { enable = true }
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end
}
