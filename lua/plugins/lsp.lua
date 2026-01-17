return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local lsp_zero = require("lsp-zero")


            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = { "rust_analyzer", "ruff" },
                handlers = {
                    lsp_zero.default_setup,
                },
            })

            -- CMP (Autocomplete) Configuration must stay here
            local cmp = require("cmp")
            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
            })
            
            vim.diagnostic.config({
                virtual_text = true
            })
        end
    }
}
