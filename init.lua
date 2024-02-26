-- Neovim的兼容性设置不需要在Lua配置中设置，nvim默认不兼容旧版vim
-- 编辑器界面和行为设置
vim.opt.virtualedit = 'block,onemore' -- 允许光标出现在最后一个字符的后面
vim.opt.number = true -- 开启行号显示
vim.cmd('syntax enable') -- 开启语法高亮
vim.opt.autoindent = true -- 开启自动缩进
vim.opt.smartindent = true
vim.opt.tabstop = 4 -- 设置制表符宽度
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true -- 高亮搜索结果
vim.opt.cursorline = true -- 高亮当前行
vim.opt.wrap = true -- 禁止折行
vim.opt.colorcolumn = "90,120" -- 设置多个折行线，在第 80 和第 120 个字符的位置
vim.opt.splitright = true -- 垂直分屏时新窗口在右侧
vim.opt.splitbelow = true -- 水平分屏时新窗口在底部
vim.opt.termguicolors = true -- 开启256色支持
vim.opt.showmatch = true -- 开启括号配对高亮
vim.opt.ruler = true -- 总是显示光标位置
vim.opt.laststatus = 2 -- 总是显示状态栏
vim.opt.cmdheight = 1 -- 设置命令行的高度
vim.opt.showcmd = true -- select模式下显示选中的行数
vim.opt.mouse = 'a' -- 启用鼠标支持
vim.opt.updatetime = 300 -- 减少更新屏幕时间，提高响应速度
vim.opt.scrolloff = 5 -- 设置上下至少留出 5 行
vim.opt.sidescrolloff = 5 -- 设置左右至少留出 5 列
vim.cmd('colorscheme onedark') -- 设置主题颜色

-- 文件处理
vim.opt.hidden = true -- 允许在buffer之间自由切换，即使有未保存的更改
vim.opt.backup = false -- 缓存设置
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.confirm = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('config') .. '/undo'
vim.cmd('filetype plugin indent on') -- 开启文件类型检测
vim.opt.history = 1000 -- 设置命令行历史长度

-- 搜索和替换
vim.opt.incsearch = true -- 开启实时搜索
vim.opt.ignorecase = true -- 搜索时忽略大小写，但在有一个或以上大写字母时保持对大小写敏感
vim.opt.smartcase = true
vim.opt.iskeyword:append('-') -- 搜索时跳过非重要匹配
vim.opt.wrapscan = true -- 允许搜索结果循环

-- 代码折叠和缩进
vim.opt.foldenable = false -- 禁用折叠代码
vim.opt.foldmethod = 'expr' -- 使用表达式进行代码折叠
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- 使用nvim_treesitter提供的表达式进行折叠
vim.g.mapleader = " " -- 映射空格键为<Leader>键
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', {
    noremap = true
})
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', {
    noremap = true
})
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {
    noremap = true
})
vim.api.nvim_create_autocmd('InsertEnter', {
    pattern = '*',
    command = 'set nohlsearch'
}) -- 自动关闭搜索高亮

-- 编码设置
vim.cmd('set termencoding=utf-8')
vim.opt.fileencodings = {'utf8', 'ucs-bom', 'gbk', 'cp936', 'gb2312', 'gb18030'}

-- 其他的require和Lua模块加载语句
require("plugins")
require('dash')
require('indent')
require('lualine_conf')
require('treesitter')
require('nvimtree')
require('formatter_conf')
require("bufferline_conf")
require('lsp_conf')
require('nvim_cmp_conf')
require('keybind')
require('comment_conf')
-- 滚轮等其他Lua模块
require('scroll')
require("scrollbar").setup()
-- gitblame配置
require('gitblame').setup {}
vim.g.gitblame_message_template = '     <summary> • <date> • <author>'
-- Telescope 扩展加载
require('telescope').load_extension('project')
