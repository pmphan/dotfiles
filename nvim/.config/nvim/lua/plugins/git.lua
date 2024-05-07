function on_attach_gitsigns(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation between hunks
    map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
    end, {expr=true})

    -- Actions
    map('n', '<Leader>hr', gs.reset_hunk)
    map('v', '<Leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<Leader>hR', gs.reset_buffer)

    map('n', '<Leader>hs', gs.stage_hunk)
    map('v', '<Leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<Leader>hS', gs.stage_buffer)

    map('n', '<Leader>hu', gs.undo_stage_hunk)
    map('n', '<Leader>hp', gs.preview_hunk)
    map('n', '<Leader>hd', gs.diffthis)
end

return {
    -- Fugitive
    { "tpope/vim-fugitive", name = "fugitive" },

    -- Gitsigns
    {
        "lewis6991/gitsigns.nvim", name = "gitsigns",
        opts = {
            on_attach = on_attach_gitsigns,
            numhl = true
        }
    },

    -- Flog
    { "rbong/vim-flog", name = "vim-flog" }
} 
