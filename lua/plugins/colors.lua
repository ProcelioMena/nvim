return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000, -- Load this before everything else
        config = function()
            require("rose-pine").setup({
                disable_background = true -- Matches your old "Normal bg = none"
            })
            vim.cmd("colorscheme rose-pine")
            
            -- Your specific override for transparent background
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end,
    }
}
