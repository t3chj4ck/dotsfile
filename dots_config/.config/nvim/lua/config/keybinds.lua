vim.g.mapleader = " "
vim.g.maplocalleader = " "

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "file saved" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "Toggle Neo-tree" })

vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = 'Telescope live grep' })

vim.keymap.set("n", "<leader>c", "gcc", { remap = true, desc = "line comment" })
vim.keymap.set("v", "<leader>c", "gc", { remap = true, desc = "block comment" })


vim.keymap.set("n", "<C-w>", ":bd<CR>", { silent = true, desc = "close buffer" })
