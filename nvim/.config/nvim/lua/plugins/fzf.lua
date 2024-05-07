return {
    {
        "junegunn/fzf", name = "fzf",
        build = function() vim.fn["fzf#install"]() end
    },
    { "ibhagwan/fzf-lua", name = "fzf-lua", dependencies = { "fzf" } }
}
