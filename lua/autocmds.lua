-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Open help windows in a vertical split to the right
vim.api.nvim_create_autocmd('BufWinEnter', {
    callback = function()
        if vim.o.filetype == 'help' then
            vim.cmd.wincmd('L')
        end
    end,
})
