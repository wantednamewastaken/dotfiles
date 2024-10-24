vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") >= 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
          vim.cmd("normal! g`\"")
        end
end
})

-- Autocommand for Rust files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.rs",
    callback = function()
        vim.cmd("syntax enable")
        vim.cmd("filetype plugin indent on")
        vim.opt.omnifunc = "ale#completion#OmniFunc"
        vim.g.ale_completion_enabled = 1
        vim.g.ale_completion_autoimport = 1
    end
})

-- "au BufNewFile,BufRead *.rb
-- "        \ syntax enable
-- "        \ | filetype plugin indent on
-- "        \ | set omnifunc=syntaxcomplete#Complete
-- "        \ | let g:ale_completion_enabled = 1
-- "        \ | let g:ale_completion_autoimport = 1

-- Autocommand for Nix files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.nix",
    callback = function()
        --vim.cmd("colorscheme molokai")
	imap('jj','<Esc>:lua vim.lsp.buf.format()<cr>')
	vim.o.tabstop=2
	vim.o.softtabstop=2
	vim.o.shiftwidth=2
    end
})

-- Autocommand for Text files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.txt",
    callback = function()
        vim.cmd([[colorscheme molokai]])
        vim.o.textwidth=120
    end
})

-- Autocommand for Python files
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*.py",
    callback = function()
        vim.cmd([[colorscheme gruvbox]])
        vim.o.tabstop=4
        vim.o.softtabstop=4
        vim.o.shiftwidth=4
        vim.o.textwidth=140
        vim.o.expandtab = true
        vim.o.autoindent = true
        vim.o.fileformat="unix"
    end
})

