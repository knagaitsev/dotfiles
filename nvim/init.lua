local vimScriptPath = vim.fn.stdpath('config') .. '/config.vim'

-- Execute the Vimscript code in the .vim file
vim.cmd('source ' .. vimScriptPath)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/which-key.nvim",
	-- "tpope/vim-commentary",
	{
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
    'freddiehaddad/feline.nvim',
    opts = {},
		config = function(_, opts)
		end
	},
	-- 'romgrk/barbar.nvim',
	'nvim-tree/nvim-web-devicons',
	-- 'nvim-tree/nvim-tree.lua',
	-- 'preservim/nerdtree',
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	-- {
 --  	"NeogitOrg/neogit",
 --  	dependencies = {
 --    	"nvim-lua/plenary.nvim",         -- required
 --    	"nvim-telescope/telescope.nvim", -- optional
 --    	-- "sindrets/diffview.nvim",        -- optional
 --    	-- "ibhagwan/fzf-lua",              -- optional
 --  	},
 --  	config = true
	-- },
	{
		"neoclide/coc.nvim",
		build = "npm ci",
		lazy = false,
	},
	"nvim-treesitter/nvim-treesitter",
  -- { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- "folke/neodev.nvim",
})

-- return require('packer').startup(function(use)
  -- use 'wbthomason/packer.nvim'
	-- use { "catppuccin/nvim", as = "catppuccin" }
	-- use {
		-- 'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- requires = { {'nvim-lua/plenary.nvim'} }
	-- }
	-- use 'freddiehaddad/feline.nvim'
-- end)

local ctp_feline = require('catppuccin.groups.integrations.feline')

require("feline").setup({
    components = ctp_feline.get(),
})

require('which-key').setup()

-- require("nvim-tree").setup({
-- 	on_attach = function(bufnr)
-- 		local api = require "nvim-tree.api"
-- 		api.config.mappings.default_on_attach(bufnr)
-- 		vim.keymap.set('n', '<cr>', bufnr)
-- 	end,
-- 	-- {key = "<enter>", action = "tabnew"}
-- 	-- actions = {
--  --    open_file = {
--  --      quit_on_open = true,
--  --    },
--  --  },
-- })

require("neo-tree").setup({
	window = {
		mappings = {
			["<2-LeftMouse>"] = "open_drop",
			["<cr>"] = "open_drop",
			["t"] = "open_tab_drop",
			["n"] = { 
				"add",
				-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
				-- some commands may take optional config options, see `:h neo-tree-mappings` for details
				config = {
					show_path = "none" -- "none", "relative", "absolute"
				}
			},
		},
	},
})

-- local currentScriptPath = debug.getinfo(1, "S").source:sub(2)

-- require("catppuccin").setup({
-- 	flavour = "frappe",
-- 	custom_highlights = function(colors)
--         return {
-- 					  TabLineSel = { bg = colors.pink },
--             -- TabLine = { bg = colors.white },
--         }
--     end
-- })

vim.cmd("colorscheme catppuccin-frappe")

