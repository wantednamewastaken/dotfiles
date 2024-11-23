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
--
-- Move to the next buffer
nmap('<tab>',':bnext<CR>')
-- Move to the previous buffer
nmap('<s-tab>',':bprev<CR>')

nmap('<C-f>',":Telescope find_files <cr>")
nmap('<C-g>',":Telescope git_files <cr>")
--nmap('<C-g>',":Telescope live_grep <cr>")

nmap('<A-j>',':m .+1<CR>==')
nmap('<A-k>',':m .-2<CR>==')
imap('<a-j>','<esc>:m .+1<cr>==gi')
imap('<a-k>','<esc>:m .-2<cr>==gi')
imap('<a-j>',':m ">+1<cr>gv=gv"')
imap('<A-k>',':m "<-2<CR>gv=gv"')

-- inoremap <silent><expr><TAB>
--             \ pumvisible() ? \"\<C-n" : \"\<TAB>"
vim.g.mapleader=';'
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
--nmap('T',':terminal<cr>')
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
-- nmap('<leader>so',"<cmd>lua ReloadConfig()<CR>")
-- nnoremap <Leader>r :! \&filetype %:S<cr>
nmap('<Leader>r',":execute '! ' . &filetype . ' ' . expand('%:S')<CR>")
-- nnoremap <Leader>r :execute 'w | !' . &filetype . ' ' . expand('%:S')<CR>
---- BUFFERS ----
--nmap('<Leader>so', ':luafile $MYVIMRC<cr>', { silent = true, noremap = true })
nmap('<Leader>so', '<Cmd>lua ReloadConfig()<CR>', { silent = true, noremap = true })
--vim.api.nvim_set_keymap('n', '<Leader>so', '<Cmd>lua ReloadConfig()<CR>', { silent = true, noremap = true })
---- vim.cmd('command! ReloadConfig lua ReloadConfig()')
--require("plenary.reload").reload_module("ryan") -- replace with your own namespace

-- nnoremap <Leader><f> :lua require("harpoon.mark").add_file()<cr>
--nmap('<Leader>h',':lua require("harpoon.ui").toggle_quick_menu()<cr>')
nmap('<Leader>m',':lua require("harpoon.mark").add_file()<cr>')
nmap('<Leader>l',':Lazy<cr>')
nmap('<leader>b',':Telescope buffers<cr>')
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
