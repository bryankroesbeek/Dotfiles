local function gh(repo)
	return "https://github.com" .. "/" .. repo
end

vim.pack.add({
	gh("nvim-lua/plenary.nvim"),
	gh("echasnovski/mini.icons"),
	gh("nvim-tree/nvim-web-devicons"),

	{
		src = gh("saghen/blink.cmp"),
		version = "v1",
	},

	gh("nvim-treesitter/nvim-treesitter"),
	gh("nvim-treesitter/nvim-treesitter-context"),

	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),

	gh("neovim/nvim-lspconfig"),
	gh("j-hui/fidget.nvim"),
	gh("seblyng/roslyn.nvim"),

	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-telescope/telescope-fzf-native.nvim"),
	gh("nvim-telescope/telescope-ui-select.nvim"),

	gh("mfussenegger/nvim-dap"),
	gh("nvim-neotest/nvim-nio"),
	gh("rcarriga/nvim-dap-ui"),
	gh("jay-babu/mason-nvim-dap.nvim"),
	gh("leoluz/nvim-dap-go"),

	gh("windwp/nvim-autopairs"),
	gh("stevearc/conform.nvim"),
	gh("mfussenegger/nvim-lint"),
	gh("lukas-reineke/indent-blankline.nvim"),

	gh("lewis6991/gitsigns.nvim"),
	gh("sindrets/diffview.nvim"),
	gh("folke/todo-comments.nvim"),

	gh("folke/which-key.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("stevearc/oil.nvim"),
	gh("echasnovski/mini.nvim"),
	gh("ThePrimeagen/harpoon"),

	gh("loctvl842/monokai-pro.nvim"),
	gh("tpope/vim-sleuth"),
	gh("christoomey/vim-tmux-navigator"),
})
