"fuzzy-finder
au VimEnter * : let base = getcwd()

command! -bang FJ call fzf#vim#files('~/sources/jdk8', <bang>0)
"command! -bang FG call fzf#vim#files('~/github', <bang>0)
"command! -bang FG call fzf#vim#files(base, <bang>0)
"
command! -bang FF call fzf#vim#files(base, <bang>0)

map <leader>f :FF<CR>
map <leader>d :FJ<CR>
