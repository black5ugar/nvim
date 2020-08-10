autocmd Filetype markdown inoremap <leader>s <Esc>/(==)<CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap <leader>b **** (==)<Esc>F*hi
autocmd Filetype markdown inoremap <leader>p ![](==) (==)<Esc>F[a
autocmd Filetype markdown inoremap <leader>d ~~~~ (==)<Esc>F~hi
autocmd Filetype markdown inoremap <leader>i ** (==)<Esc>F*i
autocmd Filetype markdown inoremap <leader>c ```<CR>(==)<CR>```<CR><CR>(==)<Esc>4kA
autocmd Filetype markdown inoremap <leader>a [](==) (==)<Esc>F[a
