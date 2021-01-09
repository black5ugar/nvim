" run current script whit shortcut
map <A-r> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!chromium % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'cuda'
        exec "!nvcc % -o %<"
        exec "!time ./%<"
   endif
endfunc
