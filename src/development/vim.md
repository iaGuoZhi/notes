# vim(1)

## vim basic

### tab 

```sh
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
```

### window management
```sh
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <LEADER>L :wincmd =<CR>

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
```

### misc

```
= # format
```

## vim plugins

### lsp

```
# with network
LspInstallServer <server>
# without external network
yum -y install clangd
pip install python-lsp-server
npm install -g bash-language-server
```
