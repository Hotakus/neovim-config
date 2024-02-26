require("mason").setup({
    ui = {
        ---@since 1.0.0
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = true,

        ---@since 1.0.0
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "rounded",

        ---@since 1.0.0
        -- Width of the window. Accepts:
        -- - Integer greater than 1 for fixed width.
        -- - Float in the range of 0-1 for a percentage of screen width.
        width = 0.8,

        ---@since 1.0.0
        -- Height of the window. Accepts:
        -- - Integer greater than 1 for fixed height.
        -- - Float in the range of 0-1 for a percentage of screen height.
        height = 0.9,
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    -- github = {
    --     ---@since 1.0.0
    --     -- The template URL to use when downloading assets from GitHub.
    --     -- The placeholders are the following (in order):
    --     -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    --     -- 2. The release version (e.g. "v0.3.0")
    --     -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    --     download_url_template = "https://github.com/%s/releases/download/%s/%s"
    -- },

    pip = {
        ---@since 1.0.0
        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
        upgrade_pip = false,

        ---@since 1.0.0
        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
        -- and is not recommended.
        --
        -- Example: { "--proxy", "https://proxyserver" }
        install_args = {}
    }
})
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").jsonls.setup {}
require("lspconfig").pylsp.setup {}
require("lspconfig").bashls.setup {}
require("lspconfig").cmake.setup {}
require("lspconfig").html.setup {}
require("lspconfig").hls.setup {}
require("lspconfig").yamlls.setup{}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

