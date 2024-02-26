-- load vscode snippet (friendly-snippet)
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require 'cmp'
local lspkind = require 'lspkind'

vim.api.nvim_set_hl(0, 'NormalFloat', {
    bg = '#282C34',
    fg = '#ffffff'
})
vim.api.nvim_set_hl(0, 'FloatBorder', {
    bg = '#282C34',
    fg = '#808080'
})

cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    window = {
        completion = cmp.config.window.bordered({
            border = "rounded", -- 或者其他你喜欢的边框样式
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
        }),
        documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder"
        })
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        }) -- 使用 Enter 选择补全项
    }),
    -- 使用lspkind-nvim显示类型图标
    formatting = {
        format = lspkind.cmp_format({
            with_text = true, -- do not show text alongside icons
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            before = function(entry, vim_item)
                -- Source 显示提示来源
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        })
    },
    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, -- { name = 'vsnip'}, -- 使用 vim-vsnip 作为代码片段源
    {
        name = 'luasnip'
    }, -- 使用 vim-vsnip 作为代码片段源
    {
        name = 'buffer',
        keyword_length = 4
    }, {
        name = 'path'
    }})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{
        name = 'git'
    } -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {{
        name = 'buffer'
    }})
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({'/', '?'}, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{
        name = 'buffer'
    }}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{
        name = 'path'
    }}, {{
        name = 'cmdline'
    }})
})

