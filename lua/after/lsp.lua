vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover{ border = "single", max_height = 35, max_width = 125 } end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>ee', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', '<leader>ew', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>ve', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '<leader>vi', function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set('n', '<leader>va', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>s', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', "lua_ls" },
    handlers = {
        function(server_name)
            vim.lsp.config[server_name].setup = {
                capabilities = lsp_capabilities,
            }
            vim.lsp.enable(server_name)
        end,
        lua_ls = function()
            vim.lsp.config["lua_ls"] = {
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            }
            vim.lsp.enable("lua_ls")
        end,
    }
})

vim.lsp.config["clangd"] = {
    capabilities = {
        offsetEncoding = { "utf-8", "utf-16" },
    },
    cmd = {
        "clangd",
        "--enable-config",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
    }
}
vim.lsp.enable("clangd")

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
    }, {
        {name = 'buffer'},
    }),
    mapping = cmp.mapping.preset.insert({
        ['<Up>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<Down>'] = cmp.mapping.select_next_item(cmp_select),
        ['<Tab>'] = cmp.mapping.confirm({select = true}),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})
