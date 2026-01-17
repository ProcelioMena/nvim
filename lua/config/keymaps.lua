local map = vim.keymap.set

-- =============================================================================
--  STANDARD KEYMAPS
-- =============================================================================

-- Standard Operations
map("n", "<leader>pv", vim.cmd.Ex)
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Moving Text (The Primeagen mappings)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Navigation & Centering
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Clipboard Operations
map("x", "<leader>p", [["_dP]])
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
map({"n", "v"}, "<leader>d", [["_d]])

-- Misc
map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Standard formatting (falls back to LSP/Conform)
map("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix Navigation
map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search & Replace Word Under Cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Source file
map("n", "<leader><leader>", function() vim.cmd("so") end)


-- =============================================================================
--  PLUGIN KEYMAPS
-- =============================================================================

-- TELESCOPE
map('n', '<leader>pf', function() require('telescope.builtin').find_files() end, { desc = 'Find Files' })
map('n', '<C-p>', function() require('telescope.builtin').git_files() end, { desc = 'Git Files' })
map('n', '<leader>ps', function() 
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") }) 
end, { desc = 'Grep String' })

-- HARPOON
map("n", "<leader>ha", function() require("harpoon.mark").add_file() end, { desc = "Harpoon Add" })
map("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Harpoon Menu" })
map("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end)
map("n", "<C-t>", function() require("harpoon.ui").nav_file(2) end)
map("n", "<C-n>", function() require("harpoon.ui").nav_file(3) end)
-- map("n", "<C-s>", function() require("harpoon.ui").nav_file(4) end) -- Disabled (Save conflict)

-- UNDOTREE
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree Toggle" })

-- VIM-FUGITIVE
map("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status" })

-- CODECOMPANION (AI)
map({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionActions<cr>", { desc = "AI Actions" })
map({ "n", "v" }, "<leader>c", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "AI Chat" })
map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add to AI Chat" })


-- =============================================================================
--  LSP KEYMAPS (Auto-attach)
-- =============================================================================
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        map("n", "gd", function() vim.lsp.buf.definition() end, opts)
        map("n", "K", function() vim.lsp.buf.hover() end, opts)
        map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        map("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        map("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        map("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})
