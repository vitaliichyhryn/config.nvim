vim.pack.add({ { src = 'https://github.com/stevearc/conform.nvim' } })

require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
    },
    format_on_save = {
        lsp_format = 'fallback',
    },
})
