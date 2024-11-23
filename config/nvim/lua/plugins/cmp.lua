return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	-- {
	--     "L3MON4D3/LuaSnip",
	--     version = "v2.*",
	--     -- install jsregexp (optional!).
	--     -- build = "make install_jsregexp",
	-- },
	-- "rafamadriz/friendly-snippets",
	"onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
	local cmp = require("cmp")
	--local lspkind = require("lspkind")
	--local luasnip = require("luasnip")

	--require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
	    snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
		    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
		    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	    },
	    window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	    },
	    mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
		    behavior = cmp.ConfirmBehavior.Replace,
		    select = true,
		}),
	    }),
	    sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "vsnip" },
		-- { name = "luasnip" },
		-- { name = "ultisnips" },
		-- { name = "snippy" },
	    }, {
		{ name = "buffer" },
	    }),
	})

	-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
	-- Set configuration for specific filetype.
	--[[ cmp.setup.filetype('gitcommit', {
	    sources = cmp.config.sources({
		{ name = 'git' },
	    }, {
		{ name = 'buffer' },
	    })
	})
	require("cmp_git").setup() ]]-- 

	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = {
		{ name = 'buffer' }
	    }
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	    mapping = cmp.mapping.preset.cmdline(),
	    sources = cmp.config.sources({
		{ name = 'path' }
	    }, {
		{ name = 'cmdline' }
	    }),
	    matching = { disallow_symbol_nonprefix_matching = false }
	})

	-- Set up lspconfig.
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
	require('lspconfig')['rust_analyzer'].setup {
	    capabilities = capabilities
	}
	--    settings = {
	--	['rust-analyzer'] = {},
	--    }
	require('lspconfig')['lua_ls'].setup {
	    capabilities = capabilities
	}
	require('lspconfig')['pyright'].setup {
	    capabilities = capabilities
	}
	require('lspconfig')['nixd'].setup {
	    capabilities = capabilities
	}
    end,
}
	    -- vim.cmd([[
	    -- set completopt=menuone,noinsert,noselect
	    -- highlight! default link CmpItemKind CmpItemMenuDefault
	    -- ]])
