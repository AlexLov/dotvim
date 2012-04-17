" Maintainer:		see in viewdoc.vim
" Version:		see in viewdoc.vim
" Last Modified:	see in viewdoc.vim
" License:		see in viewdoc.vim
" URL:			see in viewdoc.vim
" Description: ViewDoc handler for vim help files

if exists('g:loaded_viewdoc_help') || &cp || version < 700
	finish
endif
let g:loaded_viewdoc_help = 1


""" Interface
" - command
command -bar -bang -nargs=1 -complete=help ViewDocHelp
	\ call ViewDoc('<bang>'=='' ? 'new' : 'doc', <f-args>, 'help')
" - abbrev
if !exists('g:no_plugin_abbrev') && !exists('g:no_viewdoc_abbrev')
	cabbrev <expr> help     getcmdtype()==':' && getcmdline()=='help'  ? 'ViewDocHelp' : 'help'
	cabbrev <expr> help!    getcmdtype()==':' && getcmdline()=='help!' ? 'ViewDocHelp' : 'help!'
endif

""" Handlers

function g:ViewDoc_help(topic, filetype, synid, ctx)
	let h = { 'ft':		'help',
		\ 'topic':	a:topic,
		\ }
	if a:ctx
		if h.topic !~ "^'.*'$" && (synIDattr(a:synid,'name') =~# 'Option' || search('&\k*\%#','n'))
			let h.topic = "'" . h.topic . "'"	" auto-detect: 'option'
		elseif synIDattr(a:synid,'name') =~ 'Command'
			let h.topic = ':' . h.topic		" auto-detect: :command
		endif
	endif
	try
		let savetabnr	= tabpagenr()
		execute 'tab help ' . h.topic
		let helpfile	= bufname(bufnr(''))
		let h.cmd	= printf('cat %s', shellescape(helpfile,1))
		let h.line	= line('.')
		let h.col	= col('.')
		let h.tags	= substitute(helpfile, '/[^/]*$', '/tags', '')
		tabclose
		execute 'tabnext ' . savetabnr
	catch
	endtry
	return h
endfunction

let g:ViewDoc_vim = function('g:ViewDoc_help')

function g:ViewDoc_help_custom(topic, ft, ...)
	let h = { 'ft':		'help',
		\ 'docft':	a:ft,
		\ }
	let savetabnr	= tabpagenr()
	for helpfile in split(globpath(&runtimepath, 'ftdoc/'.a:ft.'/*.txt'),"\<NL>")
		let tagsfile	= substitute(helpfile, '/[^/]*$', '/tags', '')
		execute 'tabedit ' . helpfile
		execute 'setlocal tags^=' . tagsfile
		for tag_guess in [a:topic, "'".a:topic."'", a:ft.'-'.a:topic]
			try
				execute 'tag ' . tag_guess
			catch
				continue
			endtry
			let h.cmd	= printf('cat %s', shellescape(helpfile,1))
			let h.line	= line('.')
			let h.col	= col('.')
			let h.tags	= tagsfile
			break
		endfor
		setlocal bufhidden=delete
		tabclose
		if exists('h.cmd')
			break
		endif
	endfor
	execute 'tabnext ' . savetabnr
	return h
endfunction

