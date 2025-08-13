vim.pack.add({ { src = 'https://github.com/lewis6991/gitsigns.nvim' } })

local gitsigns = require('gitsigns')
gitsigns.setup({
    on_attach = function(bufnr)
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']h', function()
            if vim.wo.diff then
                vim.cmd.normal({ ']h', bang = true })
            else
                gitsigns.nav_hunk('next')
            end
        end, { desc = 'Hunk' })

        map('n', '[h', function()
            if vim.wo.diff then
                vim.cmd.normal({ '[h', bang = true })
            else
                gitsigns.nav_hunk('prev')
            end
        end, { desc = 'Hunk' })

        -- Actions
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[S]tage Hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[R]eset Hunk' })

        map('v', '<leader>gs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = '[S]tage Hunk ' })
        map('v', '<leader>gr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = '[R]eset Hunk ' })

        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[P]review Hunk' })
        map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = '[P]review Hunk [I]nline' })

        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage Buffer ' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset Buffer ' })

        map('n', '<leader>gb', function()
            gitsigns.blame_line({ full = true })
        end, { desc = '[B]lame Hunk' })

        map('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff Index' })

        map('n', '<leader>gD', function()
            gitsigns.diffthis('HEAD')
        end, { desc = '[Diff] HEAD' })

        map('n', '<leader>gQ', function()
            gitsigns.setqflist('all')
        end, { desc = '[Q]uickfix All Hunks' })
        map('n', '<leader>gq', gitsigns.setqflist, { desc = '[Q]uickfix Hunks' })

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
    end,
})
