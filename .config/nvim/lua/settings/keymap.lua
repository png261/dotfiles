local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local map = vim.api.nvim_set_keymap

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>d", '"_d', opts)
map("v", "<leader>d", '"_d', opts)

-- formatter
map("n", "<leader>fm", ":FormatWrite<cr>", opts)

---telescope--
map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", opts)
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", opts)
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", opts)

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
