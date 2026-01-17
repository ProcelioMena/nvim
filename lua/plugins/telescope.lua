return {
    {
        "nvim-telescope/telescope.nvim",
        -- removing 'tag' and 'branch' allows us to pull the latest 'master' version
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')
            
            -- We need to explicit setup to ensure defaults are correct
            require('telescope').setup({})

            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    }
}
