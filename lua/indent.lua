local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = true,
    },
    scope = { enabled = false },
}
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "IBLDisable"
})
