vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ 'n', 'v' }, 'd', '"_d', { noremap = true })
vim.keymap.set({ 'n', 'v' }, 'D', '"_D', { noremap = true })

--format when save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
})


-- disable theme
vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

vim.wo.number = true


vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undolevels = 10000


require("neo-tree").setup({
	-- ... your existing neo-tree config ...
	event_handlers = {
		{
			event = "file_opened",
			handler = function(file_path)
				-- Auto-close Neo-tree when a file is opened
				require("neo-tree.command").execute({ action = "close" })
			end
		},
	}
})
