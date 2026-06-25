vim.g.mapleader = " "
vim.g.maplocalleader = " "

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>s', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbols' })
vim.keymap.set("n", "<leader-w>", ":bd<CR>", { silent = true, desc = "close buffer" })
