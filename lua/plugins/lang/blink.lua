require('blink-cmp').setup {
    fuzzy = { implementation = 'lua' },
    -- ghost_text = { enabled = true },
    snippets = { preset = 'luasnip' },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
        -- documentation = {
        --     auto_show = true,
        -- },
        trigger = {
            show_on_trigger_character = true,
            show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
        },
        menu = {
            draw = {
                components = {
                    kind_icon = {
                        text = function(ctx)
                            local icon = ctx.kind_icon
                            if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                                local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                                if dev_icon then icon = dev_icon end
                            else
                                icon = require('lspkind').symbol_map[ctx.kind] or ''
                            end

                            return icon .. ctx.icon_gap
                        end,

                        -- Optionally, use the highlight groups from nvim-web-devicons
                        -- You can also add the same function for `kind.highlight` if you want to
                        -- keep the highlight groups in sync with the icons.
                        highlight = function(ctx)
                            local hl = ctx.kind_hl
                            if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                                local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                                if dev_icon then hl = dev_hl end
                            end
                            return hl
                        end,
                    },
                },
            },
        },
    },
    keymap = {
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<Tab>'] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_and_accept()
                end
            end,
            'snippet_forward',
            'fallback',
        },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
    },
}
