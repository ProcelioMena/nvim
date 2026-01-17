local map = vim.keymap.set

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
-- Preserve default paste buffer
map("x", "<leader>p", [["_dP]])
-- Yank to system clipboard
map({"n", "v"}, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])
-- Delete to void register
map({"n", "v"}, "<leader>d", [["_d]])

-- Misc
map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Note: Replaced vim.lsp.buf.format with standard conform/lsp formatting if needed, 
-- but keeping your simple bind for now:
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
map("n", "<leader><leader>", function()
    vim.cmd("so")
end)
