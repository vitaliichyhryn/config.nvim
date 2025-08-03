vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' } })

require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'c',
        'bash',
        'rust',
        'toml',
        'go',
        'zig',
        'lua',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(event)
        if event.data.spec.name == 'nvim-treesitter' then
            vim.cmd('TSUpdate')
        end
    end,
})
