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
	'nvim-tree/nvim-web-devicons',
	'nvim-tree/nvim-tree.lua',
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	{
  	"NeogitOrg/neogit",
  	dependencies = {
    	"nvim-lua/plenary.nvim",         -- required
    	"nvim-telescope/telescope.nvim", -- optional
    	-- "sindrets/diffview.nvim",        -- optional
    	-- "ibhagwan/fzf-lua",              -- optional
  	},
  	config = true
	},
	{
		"neoclide/coc.nvim",
		-- build = "yarn install && yarn build",
		lazy = false,
	},
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

require("nvim-tree").setup({
	-- actions = {
 --    open_file = {
 --      quit_on_open = true,
 --    },
 --  },
})

local currentScriptPath = debug.getinfo(1, "S").source:sub(2)

