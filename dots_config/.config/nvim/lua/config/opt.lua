vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'D', '"_D', { noremap = true })

--format when save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})


vim.wo.number = true


vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undolevels = 10000
