vim.pack.add({ { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range('1.*') } })

require('blink.cmp').setup({
    completion = {
        documentation = { auto_show = true },
        menu = {
            draw = {
                columns = { { 'label', 'label_description', gap = 1 }, { 'kind' } },
            },
        },
        ghost_text = { enabled = true },
    },
})
