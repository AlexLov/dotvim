" Maintainer:		see in viewdoc.vim
" Version:		see in viewdoc.vim
" Last Modified:	see in viewdoc.vim
" License:		see in viewdoc.vim
" URL:			see in viewdoc.vim
" Description: ViewDoc handler for pydoc

if exists('g:loaded_viewdoc_pydoc') || &cp || version < 700
	finish
endif
let g:loaded_viewdoc_pydoc = 1


""" Handlers

function g:ViewDoc_pydoc(topic, ...)
	return	{ 'cmd':	printf('pydoc %s', shellescape(a:topic,1)),
		\ 'ft':		'pydoc',
		\ }
endfunction

let g:ViewDoc_python = function('g:ViewDoc_pydoc')

