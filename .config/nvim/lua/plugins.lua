local function gh(repo)
	return "https://github.com" .. "/" .. repo
end

vim.pack.add({
	gh("nvim-lua/plenary.nvim"),

	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-telescope/telescope-fzf-native.nvim"),
	gh("nvim-telescope/telescope-ui-select.nvim"),

	gh("nvim-tree/nvim-web-devicons"),

	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
	gh("nvim-treesitter/nvim-treesitter-refactor"),

	gh("tpope/vim-sleuth"),
	gh("j-hui/fidget.nvim"),

	gh("rcarriga/nvim-dap-ui"),
	gh("nvim-neotest/nvim-nio"),

	gh("saghen/blink.cmp"),

	gh("williamboman/mason.nvim"),
	gh("jay-babu/mason-nvim-dap.nvim"),
	gh("leoluz/nvim-dap-go"),

	gh("windwp/nvim-autopairs"),
	gh("stevearc/conform.nvim"),

	gh("mfussenegger/nvim-dap"),

	gh("lewis6991/gitsigns.nvim"),

	gh("lukas-reineke/indent-blankline.nvim"),

	gh("mfussenegger/nvim-lint"),

	gh("neovim/nvim-lspconfig"),

	gh("echasnovski/mini.nvim"),

	gh("loctvl842/monokai-pro.nvim"),

	gh("folke/todo-comments.nvim"),
	gh("nvim-treesitter/nvim-treesitter"),

	gh("folke/which-key.nvim"),

	gh("sindrets/diffview.nvim"),

	gh("ThePrimeagen/harpoon"),

	gh("nvim-lualine/lualine.nvim"),

	gh("echasnovski/mini.icons"),
	gh("stevearc/oil.nvim"),

	gh("seblyng/roslyn.nvim"),
	gh("nvim-treesitter/nvim-treesitter-context"),
	gh("christoomey/vim-tmux-navigator"),
})
