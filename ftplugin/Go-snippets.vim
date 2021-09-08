autocmd FileType go inoremap fpn fmt.Println()<Esc>i
autocmd FileType go inoremap fpf fmt.Printf()<Esc>i
autocmd FileType go inoremap fpt fmt.Print()<Esc>i

" debug golang 
autocmd FileType go nnoremap <leader>b :GoDebugBreakpoint<CR>
autocmd FileType go nnoremap <leader>n :GoDebugContinue<CR>
autocmd FileType go nnoremap <leader>d :GoDebugStart<space>
autocmd FileType go nnoremap <leader>R :!go run .<space>
