autocmd FileType python inoremap <leader>c """<CR>"""<Esc>O

" add the comment
autocmd FileType python vnoremap <leader>c I#<Space><Esc>

" remove the comment
autocmd FileType python vnoremap <leader>d lx
