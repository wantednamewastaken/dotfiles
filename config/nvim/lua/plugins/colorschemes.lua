return
{
    {
        'joshdick/onedark.vim',
        opts = {},
	config = function()
	    vim.cmd([[colorscheme onedark]])
	end,
    },
    {
	'sickill/vim-monokai',
        opts = {},
	config = function()
	    vim.cmd([[colorscheme monokai]])
	end,
    },
    {
	'tomasr/molokai',
        opts = {},
	config = function()
	    vim.cmd([[colorscheme molokai]])
	end,
    },
    {
	'morhetz/gruvbox',
        opts = {},
	config = function()
	    vim.cmd([[colorscheme gruvbox]])
	end,
    },
    {
	'NLKNguyen/papercolor-theme',
        opts = {},
	--name = "papercolor",
	config = function()
	    vim.cmd([[colorscheme PaperColor]])
	end,
    },
    {
	'artanikin/vim-synthwave84',
        opts = {},
	config = function()
	    vim.cmd([[colorscheme synthwave84]])
	end,
    },
}
