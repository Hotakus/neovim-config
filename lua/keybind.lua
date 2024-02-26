-- 切换Nvim树的显示与隐藏
vim.keymap.set('n', '<S-n>', ':NvimTreeToggle<CR>', {
    noremap = true,
    silent = true
})

-- 在缓冲区标签间向后循环切换
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', {
    noremap = true,
    silent = true
})

-- 在缓冲区标签间向前循环切换
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {
    noremap = true,
    silent = true
})

-- 使用`<leader>f`快捷键格式化当前文件
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Format<CR>', {
    noremap = true,
    silent = true
})

-- 切换缩进指导线的显示与隐藏
vim.keymap.set('n', '<S-b>', ':IBLToggle<CR>', {
    noremap = true,
    silent = true
})

-- 读取文件后自动启用缩进指导线
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    command = "IBLEnable"
})

-- 关闭文件时自动禁用缩进指导线
vim.api.nvim_create_autocmd("BufUnload", {
    pattern = "*",
    command = "IBLDisable"
})

vim.keymap.set('n', '<Left>', function()
    if vim.fn.col('.') == 1 then
        return 'k$'
    else
        return '<Left>'
    end
end, {
    noremap = true,
    expr = true
})

local api = require('Comment.api')
local config = require('Comment.config'):get()

-- Toggle current line (linewise) using C-/
vim.keymap.set('n', '<C-_>', require('Comment.api').toggle.linewise.current)

-- Toggle selection (linewise)
vim.keymap.set('x', '<C-_>', function()
    local esc_code = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    vim.api.nvim_feedkeys(esc_code, 'nx', false)
    require('Comment.api').toggle.linewise(vim.fn.visualmode())
end)

vim.keymap.set('n', '<Right>', function()
    local curr_line = vim.fn.getline('.')
    local curr_col = vim.fn.col('.')
    local end_col = #curr_line + 1
    if curr_col >= end_col then
        return 'j0'
    else
        return '<Right>'
    end
end, {
    noremap = true,
    expr = true,
    silent = true
})

vim.api.nvim_set_keymap('n', '<C-a>', 'ggVG', {
    noremap = true,
    silent = true
})

-- 在普通模式下，将 Ctrl+Z 绑定到撤销操作
vim.api.nvim_set_keymap('n', '<C-z>', 'u', {
    noremap = true,
    silent = true
})

-- 如果你也想在可视模式下使用它，可以添加：
vim.api.nvim_set_keymap('v', '<C-z>', 'u', {
    noremap = true,
    silent = true
})

-- 在普通模式下，将 Ctrl+Y 绑定到重做操作
-- vim.api.nvim_set_keymap('n', '<C-y>', '<C-r>', {noremap = true, silent = true})

-- 在普通模式下，复制整行到系统剪贴板
vim.keymap.set('n', '<C-c>', '"+yy', {
    noremap = true,
    silent = true
})

-- 在可视模式下，复制选中的文本到系统剪贴板
vim.keymap.set('v', '<C-c>', '"+y', {
    noremap = true,
    silent = true
})

-- 在可视模式下，将选中的文本剪切到系统剪贴板
vim.keymap.set('v', '<C-x>', 'd"+y', {
    noremap = true,
    silent = true
})

-- 在普通模式下，将系统剪贴板的内容粘贴到光标位置
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', {
    noremap = true,
    silent = true
})

-- 在插入模式下，将系统剪贴板的内容粘贴到光标位置
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', {
    noremap = true,
    silent = true
})

-- 在可视模式下，将系统剪贴板的内容粘贴到选中的文本的位置
vim.api.nvim_set_keymap('v', '<C-v>', '"+p', {
    noremap = true,
    silent = true
})
