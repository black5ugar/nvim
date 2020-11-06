autocmd FileType go inoremap fpn fmt.Println()<Esc>i
autocmd FileType go inoremap fpf fmt.Printf()<Esc>i

" add the comment
autocmd FileType go vnoremap <leader>c I//<Space><Esc>

" remove the comment
autocmd FileType go vnoremap <leader>d 2lx

" go test files
autocmd FileType go cnoremap got !go<Space>test<Space>-v<Space>%
