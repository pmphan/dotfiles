local function open_nvim_tree(data)
    local api = require("nvim-tree.api")

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
    api.tree.open()
end

local function on_attach_nvim_tree(bufnr)
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

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return {
    { "nvim-tree/nvim-web-devicons", name = "nvim-web-devicons" },
    {
        "nvim-tree/nvim-tree.lua", name = "nvim-tree",
        dependencies = { "nvim-web-devicons" },
        opts = {
            on_attach = on_attach_nvim_tree,
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
    }
}
