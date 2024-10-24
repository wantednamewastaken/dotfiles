function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

--vo=vim.o


--- source $VIMRUNTIME/defaults.vim
--- fenc might be pointless, just trying to fix shit"""
vim.o.fenc="utf-8"

-- Preceding dots
vim.opt.list = true
vim.opt.listchars= {
    space = '·',
    --extends = ' ',
    --precedes = ' ',
    tab = '··',
    --trail = ' ',
    eol = '↴',
}
-- set listchars=space:·,tab:*, leadmultispace:d , " eol:↴▏
-- set leadmultispace='\u258F'
vim.o.list = true
vim.o.tw = 180


if vim.fn.has("termguicolors") == 1 then
    vim.o.termguicolors = true
end

-- autocmd WinNew * wincmd L
vim.env.BASH_ENV = vim.fn.expand("~/.bash_aliases")

require('ryan.plugins')
require('ryan.autocmds')
require('ryan.extra')
require('ryan.reload')
require('ryan.nixd')

-- Eliminate potential vim issues
vim.g.nocompatible = true
-- Enable type file detection. Vim will be able to try to detect the type of file is use.
vim.cmd("filetype on")
    -- Enable plugins and load plugin for the detected file type.
vim.cmd("filetype plugin on")
    -- Load an indent file for the detected file type.
vim.cmd("filetype indent on")

vim.o.syntax = true
vim.o.number = true
vim.o.confirm = true

-- Move to the next buffer
nmap('<tab>',':bnext<CR>')
-- Move to the previous buffer
nmap('<s-tab>',':bprev<CR>')

vim.o.splitbelow = true
vim.o.splitright = true

-- Fold settings
vim.o.foldmethod = "indent"
vim.o.foldignore = ' '
vim.o.foldlevelstart = 1
vim.o.foldminlines = 20

nmap('<C-f>',":Files! <cr>")
nmap('<C-g>',":GFiles! <cr>")

nmap('<A-j>',':m .+1<CR>==')
nmap('<A-k>',':m .-2<CR>==')
imap('<a-j>','<esc>:m .+1<cr>==gi')
imap('<a-k>','<esc>:m .-2<cr>==gi')
imap('<a-j>',':m ">+1<cr>gv=gv"')
imap('<A-k>',':m "<-2<CR>gv=gv"')

-- inoremap <silent><expr><TAB>
--             \ pumvisible() ? \"\<C-n" : \"\<TAB>"
-- set instead of let?
-- let mapleader='\'
vim.g.mapleader=';'
-- let maplocalleader=something
-- Also available is 'resize' (res), 'vertical resize'
nmap('<Leader><left>',':50winc <<cr>')
nmap('<Leader><right>',':50winc ><cr>')
nmap('<Leader><up>',':5winc -<cr>')
nmap('<Leader><down>',':5winc +<cr>')
nmap('<C-A-h>','<C-w>h')
nmap('<C-A-j>','<C-w>j')
nmap('<C-A-k>','<C-w>k')
nmap('<C-A-l>','<C-w>l')
nmap('<Leader><,>','<C-w><')
nmap('<F2>',':ALEGoToDefinition<cr>')
nmap('<F3>',':ALEFindReferences<cr>')
nmap('T',':terminal<cr>')
nmap('-',':NERDTreeToggle<cr>')
nmap('<F5>',':noh<cr>')
-- nmap w :w
nmap('Q',':q<cr>')
-- imap jj <Esc>
imap('jj','<Esc>:ALEFix<cr>')
nmap('<Leader>t',':TransparentToggle<cr>')
-- nmap F :Files 
--  set NERDTree remap

--nmap('<leader>so',':source $MYVIMRC<CR>')
nmap('<leader>so',"<cmd>lua ReloadConfig()<CR>")
-- nnoremap <Leader>r :! \&filetype %:S<cr>
nmap('<Leader>r',":execute '! ' . &filetype . ' ' . expand('%:S')<CR>")
-- nnoremap <Leader>r :execute 'w | !' . &filetype . ' ' . expand('%:S')<CR>
---- BUFFERS ----
-- nnoremap <Leader><f> :lua require("harpoon.mark").add_file()<cr>
nmap('<Leader>h',':lua require("harpoon.ui").toggle_quick_menu()<cr>')
nmap('<Leader>m',':lua require("harpoon.mark").add_file()<cr>')
nmap('<leader>b',':Buffers<cr>')
nmap('<leader>j',':Jumps<cr>')
nmap('<leader>n',':bnext<cr>')
nmap('<leader>p',':bprevious<cr>')
nmap('<leader>d',':bdelete<cr>')
nmap('<leader>c',':close<cr>')
nmap('<leader>s',':vsplit<cr>')
nmap('<leader>w',':w<cr>')
----Quickfix----
nmap('<leader>q',':copen<cr>')
nmap('<leader>v',':cnext<cr>')
nmap('<leader>x',':cprev<cr>')
nmap('<leader>v',':vimgrep')
-------
-- vim.lsp.buf.rename() probably useful to setup to change variable names easy

vim.g.powerline_pycmd = "py3"
-- python3 from powerline.vim import setup as powerline_setup
-- python3 powerline_setup()
-- python3 del powerline_setup

vim.g.python_highlight_all = 1
vim.g.ale_set_highlights = 1

vim.g.ale_completion_enabled = 1
-- let g:ale_python_flake8_config_file = '~/.config/flake8'
--- This is working "
-- Rest of pycodestyle config seems to work in ~/.config/pycodestyle
vim.g.ale_python_flake8_options = '--max-line-length=140 --ignore=E501,E266,W503 --extend-ignore=W503'
---
vim.g.ale_linters = {
   python = {'flake8','pyright','pylsp'},
   rust = {'analyzer', 'cargo', 'rls', 'rustc'},
   ruby = {'rubocop'},
   lua = {'luacheck', 'lua_ls'},
   nix = {'nixd'},
}
-- " 'pylint'
vim.g.ale_rust_rls_toolchain = 'stable'

vim.g.ale_fixers = {
   python = {'black','isort'},
   ruby = {'rubocop'},
   lua = {'luafmt', 'stylua'},
}

-- call ale#Set('python_flake8_options', '--config=$HOME/.config/flake8')
----- IMPORTANT -----
-- Storing buffer b:ale_fixer in /home/ryan/.vim/ftplugin/python.vim 
-- Not true anymore, but still good to know if having plugin 'interference'

vim.g.ale_fix_on_save = 1
-- print("Setting color...")
-- vim.cmd([[colorscheme monokai]])
vim.cmd.colorscheme "monokai"
-- vim.cmd("colorscheme synthwave84")
-- vim.cmd("colorscheme molokai ")
-- vim.cmd("colorscheme onedark")
-- vim.cmd [[ colorscheme gruvbox ]]
-- print("SHould be set")

vim.cmd [[ packloadall ]]
vim.cmd [[ silent! = helptags ALL ]]

-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
-- "               
-- "               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
-- "               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
-- "               ██║   ██║██║██╔████╔██║██████╔╝██║     
-- "               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
-- "                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
-- "                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
-- "               
-- """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
-- " Disable compatibility with vi which can cause unexpected issues.
vim.g.nocompatible = true
-- " Highlight cursor line underneath the cursor horizontally.
vim.o.cursorline = true
-- " Highlight cursor line underneath the cursor vertically.
vim.g.nocursorcolumn = true
-- " Set shift width to 4 spaces.
vim.g.shiftwidth = 4
-- " Set tab width to 4 columns.
vim.g.tabstop=4
-- " Use space characters instead of tabs.
vim.g.expandtab = true
-- " Do not save backup files.
vim.g.nobackup = true
-- " Do not let cursor scroll below or above N number of lines when scrolling.
vim.g.scrolloff=10
-- " Do not wrap lines. Allow long lines to extend as far as the line goes.
vim.g.nowrap = true
-- " While searching though a file incrementally highlight matching characters as you type.
vim.g.incsearch = true
-- " Ignore capital letters during search.
vim.g.ignorecase = true
-- " Override the ignorecase option if searching for capital letters.
-- " This will allow you to search specifically for capital letters.
vim.g.smartcase = true
-- " Show partial command you type in the last line of the screen.
vim.g.showcmd = true
-- " Show the mode you are on the last line.
vim.g.showmode = true
-- " Show matching words during a search.
vim.g.showmatch = true
-- " Use highlighting when doing a search.
vim.g.hlsearch = true
-- " Set the commands to save in history default number is 20.
vim.g.story=1000
-- " Enable auto completion menu after pressing TAB.
vim.g.wildmenu = true
-- " Make wildmenu behave like similar to Bash completion.
vim.g.wildmode="list:longest" 
-- " There are certain files that we would never want to edit with Vim.
-- " Wildmenu will ignore files with these extensions.
vim.opt.wildignore ="*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx"
-- " set ssop-=options

-- " STATUS LINE ------------------------------------------------------------ {{{
-- " Clear status line when vimrc is reloaded.
vim.o.statusline= ""
-- " Status line left side.
vim.o.statusline = vim.opt.statusline:get() .. "%F %M %Y %R"
-- " Use a divider to separate the left side from the right side.
vim.o.statusline = vim.opt.statusline:get() .. "%="
-- " Status line right side.
vim.o.statusline = vim.opt.statusline:get() .. " ascii: %b hex: 0x%B row: %l col: %c percent: %p%%"
-- " Show the status on the second to last line.
vim.o.laststatus=2

vim.o.relativenumber = true

-- "python3 from powerline.vim import setup as powerline_setup
-- "python3 powerline_setup()
-- "python3 del powerline_setup
-- """"""""""""""""""""""""""""""""""""""""""""""""
-- "set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim/
-- "set laststatus=2
-- "set t_Co=256
-- """""""""""""""""""""""""""""""""""""""""""""""'
-- " }}}

