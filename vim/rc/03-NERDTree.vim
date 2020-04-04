
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" remove NERDTree folder icon cause we use vim-devicon
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

map <f2> : NERDTreeToggle<CR>       "映射f2键打开和关闭nerdtree
