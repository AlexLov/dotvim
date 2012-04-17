" Maintainer:		see in viewdoc.vim
" Version:		see in viewdoc.vim
" Last Modified:	see in viewdoc.vim
" License:		see in viewdoc.vim
" URL:			see in viewdoc.vim
" Description: ViewDoc handler for man pages (default handler)

if exists('g:loaded_viewdoc_man') || &cp || version < 700
	finish
endif
let g:loaded_viewdoc_man = 1

""" Constants
let s:re_mansect = '\([0-9n]p\?\)'

""" Options
if !exists('g:viewdoc_man_cmd')
	let g:viewdoc_man_cmd='/usr/bin/man'	" user may want 'LANG= /usr/bin/man'
endif

""" Interface
" - command
command -bar -bang -nargs=1 -complete=custom,s:CompleteMan ViewDocMan
	\ call ViewDoc('<bang>'=='' ? 'new' : 'doc', <f-args>, 'man')
" - abbrev
if !exists('g:no_plugin_abbrev') && !exists('g:no_viewdoc_abbrev')
	cabbrev <expr> man      getcmdtype()==':' && getcmdline()=='man'  ? 'ViewDocMan'  : 'man'
	cabbrev <expr> man!     getcmdtype()==':' && getcmdline()=='man!' ? 'ViewDocMan'  : 'man!'
endif

""" Handlers

" let h = ViewDoc_man('time')
" let h = ViewDoc_man('time(2)')
" let h = ViewDoc_man('2 time')
function g:ViewDoc_man(topic, ...)
	let sect = ''
	let name = a:topic
	let m = matchlist(name, '('.s:re_mansect.')$')
	if (len(m))
		let sect = m[1]
		let name = substitute(name, '('.s:re_mansect.')$', '', '')
	endif
	let m = matchlist(name, '^'.s:re_mansect.'\s\+')
	if (len(m))
		let sect = m[1]
		let name = substitute(name, '^'.s:re_mansect.'\s\+', '', '')
	endif
	return	{ 'cmd':	printf('%s %s %s | sed "s/ \xB7 / * /" | col -b', g:viewdoc_man_cmd, sect, shellescape(name,1)),
		\ 'ft':		'man',
		\ }
endfunction

let g:ViewDoc_DEFAULT = function('g:ViewDoc_man')


""" Internal

" Autocomplete section:			time(	ti.*(
" Autocomplete command:			tim	ti.*e
" Autocomplete command in section:	2 tim	2 ti.*e
function s:CompleteMan(ArgLead, CmdLine, CursorPos)
	let manpath = substitute(system(printf('%s --path', g:viewdoc_man_cmd)),'\n$','','')
	if manpath =~ ':'
		let manpath = '{'.join(map(split(manpath,':'),'shellescape(v:val,1)'),',').'}'
	else
		let manpath = shellescape(manpath,1)
	endif
	if strpart(a:CmdLine, a:CursorPos - 1) == '('
		let m = matchlist(a:CmdLine, '\s\(\S\+\)($')
		if !len(m)
			return ''
		endif
		return system(printf('find %s/man* -type f -regex ".*/"%s"\.[0-9n]p?\(\.bz2\|\.gz\)?" -printf "%%f\n" 2>/dev/null | sed "s/\.bz2$\|\.gz$//;s/.*\///;s/\.\([^.]\+\)$/(\1)/"',
			\ manpath, shellescape(m[1],1)))
	else
		let m = matchlist(a:CmdLine, '\s'.s:re_mansect.'\s')
		let sect = len(m) ? m[1] : '*'
		return system(printf('find %s/man%s -type f -printf "%%f\n" 2>/dev/null | sed "s/\.bz2$\|\.gz$//;s/\.[^.]*$//" | sort -u',
			\ manpath, sect))
	endif
endfunction

