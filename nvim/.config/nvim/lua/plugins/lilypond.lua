vim.api.nvim_create_autocmd('BufEnter', {
    command = "syntax sync fromstart",
    pattern = { '*.ly', '*.ily', '*.tex' }
})

return {
    "martineausimon/nvim-lilypond-suite", name = "lilypond",
    opts = {
        player = {
            options = {
                fluidsynth_flags = { "~/.local/share/soundfonts/*.sf2" }
            }
        }
    },
    config = function(_, opts)
        require("nvls").setup(opts)
    end
}
