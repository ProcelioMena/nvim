return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                -- Python: Organize imports first, then format
                python = { "ruff_organize_imports", "ruff_format" },
                
                -- Lua
                lua = { "stylua" },
                
                -- Web/Cloud Configs (JSON, YAML, etc.)
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
            },
        })
    end,
}
