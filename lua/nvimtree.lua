-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    -- vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

end

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#ffa0a0
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic
    :hi link NvimTreeImageFile   Title
]])

-- OR setup with some options
require("nvim-tree").setup({
    on_attach = my_on_attach,
    -- 在每次打开一个新文件时，都重新渲染文件树
    update_focused_file = {
        enable = true,
        update_cwd = true
    },
    sort = {
        sorter = "case_sensitive"
    },
    -- view = {
    --     width = 30
    -- },
    -- renderer = {
    --     group_empty = true
    -- },
    -- filters = {
    --     dotfiles = true
    -- }
    filters = {
        dotfiles = false,
        custom = {'.git', '.cache'}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    renderer = {
        group_empty = true
    },
    view = {
        width = 30,
        side = 'right',
        number = false,
        relativenumber = false
    }
})

-- vim.api.nvim_create_autocmd("VimEnter", {
--     pattern = "*",
--     command = "NvimTreeOpen"
-- })
