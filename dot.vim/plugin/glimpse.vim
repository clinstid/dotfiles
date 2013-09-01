" vim: set noet nosta sw=4 ts=4 fdm=marker :
"
" A basic Glimpse interface for Vim
"
" Based on a Vim Tip from Jean-Rene David.
" http://vim.wikia.com/wiki/Use_glimpse_from_within_Vim
"
" Mahlon E. Smith <mahlon@martini.nu>
" $Id: glimpse.vim,v a8f9271a7cab 2009/07/30 16:35:10 mahlon $
"
" Here's a bash function that's nice too!
" function g() { command glimpse -winO -F `pwd` $1 | sed 's|^`pwd`/||'; }
"
" And a tcsh alias, while we're at it!
" alias g 'glimpse -winO -F `pwd` \!:1 | sed -e "s|^`pwd`/||"'
"

" Loaded check {{{
if exists( 'g:glimpse_loaded' )
    finish
endif
let g:glimpse_loaded = '$Rev: a8f9271a7cab $'

" }}}
" Hook up the functions to the user supplied key bindings. {{{
"
if exists( 'g:glimpseKey' )
	execute 'map ' . g:glimpseKey . ' :call <SID>Glimpse()<CR>'
endif

if exists( 'g:glimpseindexKey' )
	execute 'map ' . g:glimpseindexKey . ' :call <SID>GlimpseIndex()<CR>'
endif

" }}}
" Defaults for misc settings {{{
"
if !exists( 'g:glimpseWindowResultSize' )
	let g:glimpseWindowResultSize = 15
endif

if !exists( 'g:glimpseFlags' )
	let g:glimpseFlags = "-iny"
endif

if !exists( 'g:glimpseindexFlags' )
	let g:glimpseindexFlags = '-M 10 -B -o'
endif

if !exists( 'g:glimpseErrorFormat' )
	let g:glimpseErrorFormat = '%f: %l: %m'
endif


"}}}
" Commands {{{
"
command! -nargs=* Glimpse :call <SID>Glimpse( <f-args> )
command! GlimpseIndex :call <SID>GlimpseIndex()


"}}}
" Glimpse( search_pattern, file_pattern ) {{{
"
" Run a glimpse search using a pattern from +search_pattern+ and an optional
" +file_pattern+ to limit the breadth of the search.  Places results into the
" quickfix window.
"
function! <SID>Glimpse( ... )

	" parse command line opts
	"
	let l:search_pattern = expand("<cword>")
	let l:file_pattern   = ''
	if exists( 'a:1' )
		let l:search_pattern = a:1
	endif
	if exists( 'a:2' )
		let l:file_pattern = a:2
	endif

	" everything is based on the cwd so results are relevant to the
	" current project.
	"
	let l:cwd = getcwd()

	" save the original error format, we want to play nice with others.
	"
	let l:orig_errorformat = &errorformat
	execute 'set errorformat=' . escape( g:glimpseErrorFormat, ' ' )

	" execute the search.
	"
	let l:cmd = "glimpse " . g:glimpseFlags . " -F '" . l:cwd
	if ( l:file_pattern != '' )
		let l:cmd = l:cmd . ";" . l:file_pattern
	endif
	let l:cmd = l:cmd . "' '" . l:search_pattern . "'"

	let l:result_list = split( system( l:cmd ), "\n" )

	" no results, escape now
	"
	if ( empty(l:result_list) )
		let l:no_match_msg = "No matches for '" . l:search_pattern . "'"
		if ( l:file_pattern != '' )
			let l:no_match_msg = l:no_match_msg . " in files matching '" . l:file_pattern . "'"
		endif
		call s:err( l:no_match_msg )
		execute 'set errorformat=' . escape( l:orig_errorformat, ' ' )
		return
	endif

	" populate the quickfix window.
	"
	let l:results = ''
	for l:result in l:result_list
		" 'pretty up' the glimpse output.
		let l:result = substitute( l:result, ('^' . l:cwd . '/'), '', '' )
		let l:result = substitute( l:result, '\(: \d\+:\)\s\+', '\=submatch(1) . " "', '' )

		let l:results = l:results . l:result . "\n"
	endfor
	cgetexpr( l:results )
	execute ':copen' . g:glimpseWindowResultSize

	" quick close
    nnoremap <silent> <buffer> q :ccl<CR>

	" reset error format to the original
	execute 'set errorformat=' . escape( l:orig_errorformat, ' ' )
endfunction


" }}}
" GlimpseReindex() {{{
"
" Update local indexes for the current working directory.
" Results of the index are placed into the location list. (:lopen to view.)
"
function! <SID>GlimpseIndex()
	let l:cmd = 'glimpseindex ' . g:glimpseindexFlags . ' -f .'
	let l:cwd = getcwd()
	let $LC_ALL = 'C'
	let l:index_output = system(l:cmd)
	let l:index_exit = v:shell_error
	call s:err( "Updated indexes for '" . l:cwd . "'" )
	if l:index_exit != 0
		call s:err( "Uh oh, " . l:cmd . " exited with " . l:index_exit. "!  Output follows:" )
		call s:err( l:index_output )
	endif
endfunction


" }}}
" s:err( msg ) {{{
"
" Notify user in a consistent fashion.
"
function! s:err( msg )
    echohl WarningMsg|echomsg 'glimpse: ' . a:msg|echohl None
endfunction " }}}

