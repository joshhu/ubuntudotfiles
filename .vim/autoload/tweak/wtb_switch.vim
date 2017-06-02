func! tweak#wtb_switch#key_leader_bufnum(num)
    let l:buffers = tweak#wtb_switch#buflisted()
    let l:input = a:num . ""

    while 1

        let l:cnt = 0
        let l:i=0
        " count matches
        while l:i<len(l:buffers)
            let l:bn = l:buffers[l:i] . ""
            if l:input==l:bn[0:len(l:input)-1]
                let l:cnt+=1
            endif
            let l:i+=1
        endwhile

        " no matches
        if l:cnt==0 && len(l:input)>0
            echo "no buffer [" . l:input . "]"
            return ''
        elseif l:cnt==1
            return ":b " . l:input . "\<CR>"
        endif

        echo ":b " . l:input

        let l:n = getchar()

        if l:n==char2nr("\<BS>") ||  l:n==char2nr("\<C-h>")
            " delete one word
            if len(l:input)>=2
                let l:input = l:input[0:len(l:input)-2]
            else
                let l:input = ""
            endif
        elseif l:n==char2nr("\<CR>") || (l:n<char2nr('0') || l:n>char2nr('9'))
            return ":b " . l:input . "\<CR>"
        else
            let l:input = l:input . nr2char(l:n)
        endif

        let g:n = l:n

    endwhile
endfunc

func! tweak#wtb_switch#buflisted()
  return filter(range(1, bufnr('$')), 'buflisted(v:val)')
endfunc
