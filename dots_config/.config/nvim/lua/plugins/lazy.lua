local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)



--pulgin download






require("lazy").setup({




	"tpope/vim-commentary", --fast comment





	{
		"nvim-lualine/lualine.nvim",
		config = function() require("lualine").setup() end
	}, --status bar






	--lsp cmp
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },


















	--filemanager

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
					filtered_items = {
						visible = true,
						show_hidden_count = true,
						hide_dotfiles = false,
						hide_gitgnored = false,
					},
				},
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
		end,
	},




	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			require("bufferline").setup({})
		end,
	},

















	--color theme
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('kanagawa').setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				-- terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "dragon", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
					light = "lotus"
				},
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},






	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- optional but recommended
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	}, --find text

	-- {
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		local notify = require("notify")

	-- 		-- take over notify
	-- 		vim.notify = notify

	-- 		-- hide warn
	-- 		vim.notify = function(msg, log_level, opts)
	-- 			-- （WARN = 3）
	-- 			-- if msg:match("Neo%-tree") and log_level == 3 then
	-- 			-- 	return
	-- 			-- end
	-- 			-- pop erro msg etd..
	-- 			notify(msg, log_level, opts)
	-- 		end
	-- 	end
	-- },


	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},


	-- indent and hightlight
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
		},
	},


})
