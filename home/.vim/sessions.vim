
" Vim session config
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Git vim sessions
function! Strip(input_string)
    return substitute(a:input_string, '^\_s*\(.\{-}\)\_s*$', '\1', '')
endfunction

function! b:getCurrentGitBranch()
    let l:result = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    return Strip(l:result)
endfunction

function! b:getGitDirectory(...)
    let l:result = system('git rev-parse --show-toplevel')
    return Strip(l:result)
endfunction

function! b:getSafeGitDirectory()
    let l:result = b:getGitDirectory()
    return substitute(l:result, '/', '-', 'g')
endfunction

function! b:getGitSessionName(...)
    if a:0 ># 0
        let l:branch = a:1
    else
        let l:branch = b:getCurrentGitBranch()
    endif
    let l:dir = b:getSafeGitDirectory()
    return l:dir . '_' . l:branch
endfunction

let s:save_session_command = 'SaveSession'
function! b:saveGitSession(...)
    let name = call(function('b:getGitSessionName'), a:000)
    execute s:save_session_command name
endfunction

let s:open_session_command = 'OpenSession'
function! b:openGitSession(...)
    let name = call(function('b:getGitSessionName'), a:000)
    execute s:open_session_command name
endfunction

function! b:sessionGitCheckout(branch)
    let l:currentBranch = b:getCurrentGitBranch()
    let l:checkoutResult = system('git checkout ' . shellescape(a:branch))
    if v:shell_error
        echo l:checkoutResult
        return
    endif
    call b:saveGitSession(l:currentBranch)
    CloseSession
    try
        " Will fail if that git branch has no session
        call b:openGitSession()
    endtry
endfunction

command! -nargs=1 Gsc call b:sessionGitCheckout(<f-args>)

command! -nargs=* -bang Gss let s:save_session_command = 'SaveSession<bang>' | call b:saveGitSession(<f-args>) | let s:save_session_command = 'SaveSession'
command! -nargs=* -bang SGss silent<bang> Gos <args>

command! -nargs=* -bang Gos let s:open_session_command = 'OpenSession<bang>' | call b:openGitSession(<f-args>) | let s:open_session_command = 'OpenSession'
command! -nargs=* -bang SGos silent<bang> Gos <args>

command! -nargs=* Gsn echo b:getGitSessionName(<f-args>)

" if !len(argv())
"     silent call b:openGitSession()
" endif
