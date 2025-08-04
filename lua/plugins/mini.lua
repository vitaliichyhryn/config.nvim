vim.pack.add({ { src = 'https://github.com/echasnovski/mini.nvim' } })

local gen_spec = require('mini.ai').gen_spec
require('mini.ai').setup({
    custom_textobjects = {
        -- Function definition
        F = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },
})
require('mini.surround').setup()
require('mini.pairs').setup()
