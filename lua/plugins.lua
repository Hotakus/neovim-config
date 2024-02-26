-- 插件管理器配置
require("packer").init({
    git = {
        default_url_format = "git@github.com:%s"
    }
})

-- 使用 Packer 的启动函数
return require("packer").startup(function(use)
    -- 插件管理器
    use("wbthomason/packer.nvim") -- Packer 可以管理它自己

    -- UI 增强
    use 'nvimdev/dashboard-nvim' -- 一个简洁的启动页面
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons"
    }) -- 文件浏览器
    use({
        "nvim-lualine/lualine.nvim",
        requires = "nvim-tree/nvim-web-devicons"
    }) -- 状态栏美化
    use({
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = "nvim-tree/nvim-web-devicons"
    }) -- 标签页导航
    use 'navarasu/onedark.nvim' -- One Dark 颜色主题
    use 'wittyjudge/gruvbox-material.nvim' -- Gruvbox 颜色主题
    use({
        "dracula/vim",
        as = "dracula"
    }) -- Dracula 主题

    -- 编辑增强
    use("rstacruz/vim-closer") -- 自动闭合括号
    use 'mg979/vim-visual-multi' -- 多光标编辑插件

    -- 语法高亮和代码美化
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }) -- Treesitter 高亮
    use "lukas-reineke/indent-blankline.nvim" -- 缩进指示线
    use({
        "andymass/vim-matchup",
        event = "VimEnter"
    }) -- 括号匹配和高亮

    -- LSP 和代码自动补全
    use({"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig"}) -- LSP 安装和配置
    use 'hrsh7th/nvim-cmp' -- nvim-cmp 主插件
    use 'hrsh7th/cmp-nvim-lsp' -- LSP 源
    use 'hrsh7th/cmp-buffer' -- 缓冲区自动补全源
    use 'hrsh7th/cmp-path' -- 路径自动补全源
    use 'hrsh7th/cmp-cmdline' -- 命令行自动补全源
    use 'onsails/lspkind-nvim' -- 自动补全图标

    -- 代码片段支持
    use 'hrsh7th/vim-vsnip' -- vim-vsnip 插件
    use 'hrsh7th/cmp-vsnip' -- 用于 nvim-cmp 的 vsnip 源
    use 'rafamadriz/friendly-snippets' -- 预设的代码片段集合
    use 'L3MON4D3/LuaSnip' -- LuaSnip 插件
    use 'saadparwaiz1/cmp_luasnip' -- LuaSnip 源
    use 'SirVer/ultisnips' -- UltiSnips 插件
    use 'quangnguyen30192/cmp-nvim-ultisnips' -- UltiSnips 源
    use 'dcampos/nvim-snippy' -- Snippy 插件
    use 'dcampos/cmp-snippy' -- Snippy 源

    -- Git 集成
    use 'lewis6991/gitsigns.nvim' -- 在签名列显示 git 信息
    use 'f-person/git-blame.nvim' -- 在状态栏显示 git blame 信息
    use "sindrets/diffview.nvim" -- 用于查看 git diffs 的插件

    -- 效率和工具
    use 'karb94/neoscroll.nvim' -- 平滑滚动效果
    use 'petertriho/nvim-scrollbar' -- 自定义滚动条样式
    use 'wakatime/vim-wakatime' -- 自动时间跟踪工具

    -- 搜索和查找
    use {
        'nvim-telescope/telescope.nvim', -- 强大的模糊查找器
        tag = '0.1.5',
        requires = {{'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-project.nvim'}}
    }

    use {'numToStr/Comment.nvim'}
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- 代码检查和格式化
    use("mfussenegger/nvim-lint") -- 异步代码 linter
    use({"mhartington/formatter.nvim"}) -- 代码格式化插件
    use({
        "w0rp/ale", -- 异步 Lint Engine
        ft = {"sh", "zsh", "bash", "c", "cpp", "cmake", "html", "markdown", "racket", "vim", "tex"},
        cmd = "ALEEnable",
        config = "vim.cmd[[ALEEnable]]"
    })

    -- 其他插件和工具
    use({
        "glacambre/firenvim", -- 在浏览器中使用 Neovim 编辑文本
        run = function()
            vim.fn["firenvim#install"](0)
        end
    })

    -- 延迟加载插件
    use({
        "tpope/vim-dispatch", -- 异步构建系统
        opt = true,
        cmd = {"Dispatch", "Make", "Focus", "Start"}
    })
end)
