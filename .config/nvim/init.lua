require "paq" {
	"savq/paq-nvim",
	"neovim/nvim-lspconfig",
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	"github/copilot.vim",
}


vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
