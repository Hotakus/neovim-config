vim.opt.termguicolors = true
require('bufferline').setup {
    options = {
        numbers = "ordinal", -- 可以设置为 "none", "ordinal", "buffer_id", "both"
        close_command = "bdelete! %d", -- 关闭缓冲区的命令
        right_mouse_command = "bdelete! %d", -- 使用鼠标右键关闭缓冲区的命令
        left_mouse_command = "buffer %d", -- 使用鼠标左键切换缓冲区的命令
        middle_mouse_command = nil, -- 使用鼠标中键的命令（默认为空，不执行任何操作）
        indicator_icon = '▎', -- 指示器图标
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15, -- 前缀最大长度
        tab_size = 18,
        diagnostics = "nvim_lsp", -- 集成诊断信息，可以设置为 "nvim_lsp" 或 "coc"
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local res = ''
            if diagnostics_dict.error ~= nil then
                res = "-  :" .. diagnostics_dict.error .. ""
            end
            if diagnostics_dict.warning ~= nil then
                res = res .. "  :" .. diagnostics_dict.warning .. ""
            end
            return res
        end,
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        show_buffer_icons = true, -- 是否显示缓冲区图标
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- 在重新打开时保持缓冲区的排序
        separator_style = "thin", -- 分隔符样式，可选 "slant" | "thick" | "thin"
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'insert_after_current' -- 缓冲区排序方式
    }
}

