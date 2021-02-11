autocmd FileType go inoremap fpn fmt.Println()<Esc>i
autocmd FileType go inoremap fpf fmt.Printf()<Esc>i
autocmd FileType go inoremap fpt fmt.Print()<Esc>i

" go test files
autocmd FileType go cnoremap got !go<Space>test<Space>-v<Space>%
