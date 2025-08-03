-- Clear search highlights
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)

-- Windows
vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Move focus left' })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Move focus right' })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Move focus down' })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Move focus up' })

vim.keymap.set('n', '<C-S-Left>', '<C-w>H', { desc = 'Move window left' })
vim.keymap.set('n', '<C-S-Right>', '<C-w>L', { desc = 'Move window right' })
vim.keymap.set('n', '<C-S-Down>', '<C-w>J', { desc = 'Move window down' })
vim.keymap.set('n', '<C-S-Up>', '<C-w>K', { desc = 'Move window up' })

-- Buffers
vim.keymap.set('n', '<Tab>', vim.cmd.bnext, { desc = 'Go to next buffer' })
vim.keymap.set('n', '<S-Tab>', vim.cmd.bprevious, { desc = 'Go to previous buffer' })

-- vim.pack
vim.keymap.set('n', '<leader>pl', function()
    vim.print(unpack(vim.iter(vim.pack.get())
        :filter(function(obj)
            return obj.active
        end)
        :map(function(obj)
            return obj.spec.name
        end)
        :totable()))
end, { desc = '[P]ack [L]ist' })

vim.keymap.set('n', '<leader>pu', vim.pack.update, { desc = '[P]ack [U]pdate' })

vim.keymap.set('n', '<leader>pc', function()
    vim.pack.del(vim.iter(vim.pack.get())
        :filter(function(obj)
            return not obj.active
        end)
        :map(function(obj)
            return obj.spec.name
        end)
        :totable())
end, { desc = '[P]ack [C]lean' })
