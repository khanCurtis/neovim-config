return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim", --Go to this git repo to see all supported language servers
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "harper_ls", "pylyzer", "ts_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            }) --Lua
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities
            }) --Rust
            lspconfig.harper_ls.setup({
                capabilities = capabilities
            }) --Java
            lspconfig.pylyzer.setup({
                capabilities = capabilities
            }) --Python
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            }) --JavaScript

            vim.keymap.set('n', 'I', vim.lsp.buf.hover, { desc = "Vim lsp hover" })
            vim.keymap.set('n', 'D', vim.lsp.buf.definition, { desc = "Vim lsp definition" })
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Actions" })

        end
    }
}
