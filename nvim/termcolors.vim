" -----------------------------------------------------------------------------
" File: termcolors.vim
" Author: Job79
" -----------------------------------------------------------------------------

let s:color_map = {
	\'Black'       : 0,
	\'DarkRed'     : 1,
	\'DarkGreen'   : 2,
	\'DarkYellow'  : 3,
	\'DarkBlue'    : 4,
	\'DarkMagenta' : 5,
	\'DarkCyan'    : 6,
	\'LightGray'   : 7,
	\'DarkGray'    : 8,
	\'Red'         : 9,
	\'Green'       : 10,
	\'Yellow'      : 11,
	\'Blue'        : 12,
	\'Magenta'     : 13,
	\'Cyan'        : 14,
	\'White'       : 15,
\}

let s:red          = 'Red'
let s:green        = 'Green'
let s:yellow       = 'Yellow'
let s:blue         = 'Blue'
let s:magenta      = 'Magenta'
let s:cyan         = 'Cyan'

let s:dimred       = 'DarkRed'
let s:dimgreen     = 'DarkGreen'
let s:dimyellow    = 'DarkYellow'
let s:dimblue      = 'DarkBlue'
let s:dimmagenta   = 'DarkMagenta'
let s:dimcyan      = 'DarkCyan'

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name='termcolors'

if &background == "dark"
	let s:fg           = 'White'
	let s:bg           = 'Black'
	let s:dim          = 'DarkGray'
else
	let s:fg           = 'Black'
    let s:bg           = 'NONE'
    let s:dim          = 'LightGray'
endif

fun! s:HL(group, fg, bg, attr)
	if !empty(a:fg)
		if type(a:fg) == 1 " If a:bg is a string, look it up for cterm
			exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . get(s:color_map, a:fg)
		else
			exec "hi " . a:group . " guifg=" . a:fg . " ctermfg=" . a:fg
		endif
	endif

	if !empty(a:bg)
		if type(a:bg) == 1 && a:bg != 'NONE' " If a:bg is a string, look it up for cterm
			exec "hi " . a:group . " guibg=" .  a:bg . " ctermbg=" . get(s:color_map, a:bg)
		else
			exec "hi " . a:group . " guibg=" . a:bg . " ctermbg=" . a:bg
		endif
	endif

	if a:attr != ""
		exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr . " term=" . a:attr
	endif
endfun

call s:HL("Cursor",         "NONE",     "NONE",     "")
call s:HL("ColorColumn",    "",         s:dim,      "")
call s:HL("CursorColumn",   "",         s:dim,      "")
call s:HL("CursorLine",     "",         s:dim,      "")

call s:HL("VertSplit",      s:dim,      s:dim,      "")
call s:HL("Folded",         "NONE",     s:dim,      "")
call s:HL("FoldColumn",     "NONE",     s:dim,      "")
call s:HL("SignColumn",     "NONE",     "NONE",     "")

call s:HL("PMenu",          s:fg,       s:dim,      "")
call s:HL("PMenuSel",       s:dim,      s:fg,       "")

call s:HL("Conceal",        "",         "NONE",     "")
call s:HL("CursorIM",       "",         "",         "")

call s:HL("Directory",      s:blue,     "",         "")
call s:HL("DiffAdd",        s:dimgreen, "NONE",     "")
call s:HL("DiffDelete",     s:dimred,   "NONE",     "")
call s:HL("DiffChange",     s:dimcyan,  "NONE",     "")
call s:HL("DiffText",       s:cyan,  "NONE",        "")
hi link EndOfBuffer NonText
call s:HL("ErrorMsg",       s:fg,       s:red,      "")

call s:HL("IncSearch",      s:yellow,   "Black",    "reverse")
call s:HL("CursorLineNr",   "NONE",     s:dim,      "")
call s:HL("LineNr",         s:dim,      "",         "")
call s:HL("MatchParen",     "",         "NONE",     "underline,bold")
call s:HL("ModeMsg",        s:green,    "",         "")
call s:HL("MoreMsg",        s:green,    "",         "")
call s:HL("NonText",        s:dim,      "",         "")

call s:HL("Normal",         "",         "",         "")
call s:HL("InfoPopup",      s:fg,       s:dim,      "")

call s:HL("PMenuSbar",      s:fg,       s:dim,      "")
call s:HL("PMenuThumb",     s:fg,       s:dim,      "")
call s:HL("Question",       s:green,    "",         "")
call s:HL("Search",         s:yellow,   "Black",    "reverse")
call s:HL("SpecialKey",     s:dim,      "",         "")
call s:HL("SpellBad",       s:dimred,   s:fg,       "reverse")
call s:HL("SpellCap",       "",         s:red,      "reverse")
call s:HL("SpellLocal",     "",         s:red,      "reverse")
call s:HL("SpellRare",      s:dimred,   s:fg,       "reverse")
call s:HL("StatusLine",     "",         "",         "reverse")
call s:HL("StatusLineNC",   s:dim,      "",         "")
call s:HL("StatusLineTerm", s:green,    "NONE",     "reverse")
call s:HL("StatusLineTermNC", s:dimgreen, "NONE",   "reverse")
call s:HL("TabLine",        s:fg,       s:dim,      "NONE")
call s:HL("TabLineFill",    s:dim,      s:dim,      "")
call s:HL("TabLineSel",     "",         "",         "NONE")
call s:HL("Title",          s:cyan,  "",            "")
call s:HL("Visual",         "",         s:dim,      "")
call s:HL("VisualNOS",      s:dim,      "",         "")
call s:HL("WarningMsg",     s:red,      "NONE",     "")
call s:HL("WildMenu",       s:green,    s:dim,      "")

call s:HL("Underlined",     "",         "",         "underline")
call s:HL("Ignore",         s:dim,      "",         "")
call s:HL("Error",          s:red,      "White",    "reverse")

call s:HL("Todo",           s:yellow,   "NONE",     "reverse")
call s:HL("Comment",        s:dim,      "",         "")


call s:HL("Constant", s:green, "", "")
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Constant

call s:HL("Identifier", s:fg, "", "")
hi link Function        Identifier
hi link Label           Identifier
hi link Tag             Identifier

call s:HL("Statement", s:red, "", "")
hi link Conditional     Statement
hi link Repeat          Statement
hi link Operator        Statement
hi link Keyword         Statement
hi link Exception       Statement

call s:HL("PreProc", s:blue, "", "")
hi link Include         PreProc
hi link SpecialComment  PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc

call s:HL("Type", s:yellow, "", "")
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type

call s:HL("Special", s:magenta, "", "")
hi link Debug           Special
hi link SpecialChar     Special
hi link Delimiter       Special
