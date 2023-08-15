local M = {}

function M.open_nvim_tree(data)
    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not no_name and not directory then
        return
    end

    -- change to the directory
    if directory then
        vim.cmd.cd(data.file)
    end

    -- open the tree
    require("nvim-tree.api").tree.open()
end

function M.toggle_nvim_tree()
    require("nvim-tree.api").tree.toggle()
end

function M.on_attach_nvim_tree(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- set default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- override some default mappings
    vim.keymap.set('n', '<C-x>', '', { buffer = bufnr })
    vim.keymap.del('n', '<C-x>',     { buffer = bufnr })
    vim.keymap.set('n', '<C-h>', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

function M.on_attach_gitsigns(bufnr)
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

return M
