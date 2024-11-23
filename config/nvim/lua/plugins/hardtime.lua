return
{
    -- lazy.nvim
    {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {
	    restriction_mode = "hint",
	    disabled_keys = {
		-- ["j"] = {"", "n"},
		["<Up>"] = {},
		["<Down>"] = {},
		["<Left>"] = {},
		["<Right>"] = {},
	    },
	    restricted_keys = {
		["j"] = {},
		["k"] = {},
	    },
	}
    },
    {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	config = function()
	    require("nvim-autopairs").setup({
		disable_filetype = { "TelescopePrompt", "vim" },
	    })
	end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
        dependencies = {
	    'nvim-lua/plenary.nvim',
	    'nvim-treesitter/nvim-treesitter',
	    'sharkdp/fd',
	    'BurntSushi/ripgrep'
	},
        opts = {}
    },
    {
	'mg979/vim-visual-multi',
	config = function()
	end,
	--branch = "stable",
	opts = {}
    },
    {
        'christoomey/vim-tmux-navigator',
	config = function()
	end,
        opts = {}
    },
    {
        'ThePrimeagen/vim-be-good',
	config = function()
	end,
        opts = {}
    },
    {
        'dense-analysis/ale',
	config = function()
	end,
        opts = {}
    },
    {
        'preservim/nerdtree',
	config = function()
	end,
        opts = {}
    },
    {
        'rust-lang/rust.vim',
	config = function()
	end,
        opts = {}
    },
    {
        'neoclide/coc.nvim',
	config = function()
	end,
	branch = "release",
	-- version = {'branch': 'release'},
        opts = {}
    },
    {
        'neovim/nvim-lspconfig',
	config = function()
	    require('ryan.lspconfig')
	    --require('lspconfig').pyright.setup{}
	end,
	opts = {}
    },
    {
        'xiyaowong/transparent.nvim',
        opts = {}
    },
    {
        'nvim-lua/plenary.nvim',
	config = function()
	end,
        opts = {}
    },
    {
        'powerline/powerline',
	config = function()
	end,
        opts = {}
    },
    {
        'ThePrimeagen/harpoon',
        opts = {}
    },
    {
        'junegunn/fzf',
	config = function()
	    --do = { -> fzf#install() },
	end,
        opts = {}
    }
}

-- call plug#begin('~/.vim/plugged')
-- "Plug 'vim-syntastic/syntastic'
-- "Plug 'sheerun/vim-polyglot'
-- "Plug 'Exafunction/codeium.vim'
-- Plug 'vim-python/python-syntax'
-- "Plug 'davidhalter/jedi-vim'
-- Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
-- Plug 'junegunn/fzf.vim'
-- call plug#end()
