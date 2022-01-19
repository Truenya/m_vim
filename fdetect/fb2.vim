" fb2
au BufNewFile,BufRead *.fb2			set filetype=fb2
if &ft=='fb2'
    echom "its fb2 file"
    for line in getline(1,"$")
        let l = 1
        call setline(l, substitute(line, '<p>', "\t"))
        call setline(l, substitute(line, '<\/p>', ""))
        let l = l + 1
    endfor
endif

