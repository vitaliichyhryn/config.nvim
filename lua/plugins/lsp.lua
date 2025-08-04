vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'gopls',
        'lua_ls',
        'rust_analyzer',
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp', {}),
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
        local group = vim.api.nvim_create_augroup('lsp', { clear = true })

        -- Autocompletion
        -- NOTE: vim.lsp.completion doesn't support:
        --       * adequate fuzzy matching algorithm
        --       * treesitter highlighting in the docs popup window
        --       * virtual text
        -- vim.opt.completeopt = { 'menu', 'menuone', 'fuzzy', 'noinsert', 'popup' }
        --
        -- if client:supports_method('textDocument/completion') then
        --     -- Trigger autocompletion on every keypress
        --     client.server_capabilities.completionProvider.triggerCharacters =
        --         vim.iter(vim.fn.range(32, 126))
        --         :map(string.char)
        --         :totable()
        --
        --     vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        -- end

        -- Autoformat on save
        -- NOTE: vim.lsp doesn't support customization of formatters
        -- if client:supports_method('textDocument/formatting') then
        --     vim.api.nvim_create_autocmd('BufWritePre', {
        --         group = group,
        --         buffer = event.buf,
        --         callback = function()
        --             vim.lsp.buf.format({ bufnr = event.buf, id = client.id })
        --         end,
        --     })
        -- end

        -- Highlight references on hold
        if client:supports_method('textDocument/documentHighlight') then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                group = group,
                buffer = event.buf,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                group = group,
                buffer = event.buf,
                callback = vim.lsp.buf.clear_references,
            })
        end

        -- Inlay hints
        -- if client:supports_method('textDocument/inlayHint') then
        --     vim.lsp.inlay_hint.enable(true, {bufnr = event.buf})
        -- end
    end,
})
