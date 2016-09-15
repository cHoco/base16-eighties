" base16-vim (https://github.com/chriskempson/base16-vim)
" by Chris Kempson (http://chriskempson.com)
" Eighties scheme by Chris Kempson (http://chriskempson.com)

" GUI color definitions
let s:gui00 = "2d2d2d"
let s:gui01 = "393939"
let s:gui02 = "515151"
let s:gui03 = "747369"
let s:gui04 = "a09f93"
let s:gui05 = "d3d0c8"
let s:gui06 = "e8e6df"
let s:gui07 = "f2f0ec"
let s:gui08 = "f2777a"
let s:gui09 = "f99157"
let s:gui0A = "ffcc66"
let s:gui0B = "99cc99"
let s:gui0C = "66cccc"
let s:gui0D = "6699cc"
let s:gui0E = "cc99cc"
let s:gui0F = "d27b53"

" Terminal color definitions
let s:cterm00 = "00"
let s:cterm03 = "08"
let s:cterm05 = "07"
let s:cterm07 = "15"
let s:cterm08 = "01"
let s:cterm0A = "03"
let s:cterm0B = "02"
let s:cterm0C = "06"
let s:cterm0D = "04"
let s:cterm0E = "05"
let s:cterm01 = "10"
let s:cterm02 = "11"
let s:cterm04 = "12"
let s:cterm06 = "13"
let s:cterm09 = "09"
let s:cterm0F = "14"

" Neovim color definitions for terminal mode
if has("nvim")
  let g:terminal_color_0 =  "#" . s:gui00
  let g:terminal_color_1 =  "#" . s:gui08
  let g:terminal_color_2 =  "#" . s:gui0B
  let g:terminal_color_3 =  "#" . s:gui0A
  let g:terminal_color_4 =  "#" . s:gui0D
  let g:terminal_color_5 =  "#" . s:gui0E
  let g:terminal_color_6 =  "#" . s:gui0C
  let g:terminal_color_7 =  "#" . s:gui05
  let g:terminal_color_8 =  "#" . s:gui03
  let g:terminal_color_9 =  "#" . s:gui09
  let g:terminal_color_10 = "#" . s:gui01
  let g:terminal_color_11 = "#" . s:gui02
  let g:terminal_color_12 = "#" . s:gui04
  let g:terminal_color_13 = "#" . s:gui06
  let g:terminal_color_14 = "#" . s:gui0F
  let g:terminal_color_15 = "#" . s:gui07
  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
  if &background == "light"
    let g:terminal_color_background = g:terminal_color_7
    let g:terminal_color_foreground = g:terminal_color_2
  endif
endif

" Theme setup
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "base16-eighties"

" Highlighting function
fun! s:HL(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi! " . a:group . " guifg=#" . s:GUI(a:guifg)
  endif
  if a:guibg != ""
    exec "hi! " . a:group . " guibg=#" . s:GUI(a:guibg)
  endif
  if a:ctermfg != ""
    exec "hi! " . a:group . " ctermfg=" . s:CTERM(a:ctermfg)
  endif
  if a:ctermbg != ""
    exec "hi! " . a:group . " ctermbg=" . s:CTERM(a:ctermbg)
  endif
  if a:attr != ""
    exec "hi! " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:guisp != ""
    exec "hi! " . a:group . " guisp=#" . a:guisp
  endif
endfun

" Return GUI color for light/dark variants
fun! s:GUI(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:gui00
    return s:gui07
  elseif a:color == s:gui01
    return s:gui06
  elseif a:color == s:gui02
    return s:gui05
  elseif a:color == s:gui03
    return s:gui04
  elseif a:color == s:gui04
    return s:gui03
  elseif a:color == s:gui05
    return s:gui02
  elseif a:color == s:gui06
    return s:gui01
  elseif a:color == s:gui07
    return s:gui00
  endif

  return a:color
endfun

" Return terminal color for light/dark variants
fun! s:CTERM(color)
  if &background == "dark"
    return a:color
  endif

  if a:color == s:cterm00
    return s:cterm07
  elseif a:color == s:cterm01
    return s:cterm06
  elseif a:color == s:cterm02
    return s:cterm05
  elseif a:color == s:cterm03
    return s:cterm04
  elseif a:color == s:cterm04
    return s:cterm03
  elseif a:color == s:cterm05
    return s:cterm02
  elseif a:color == s:cterm06
    return s:cterm01
  elseif a:color == s:cterm07
    return s:cterm00
  endif
endfun

" Vim editor colors
call s:HL("Bold",          "", "", "", "", "bold", "")
call s:HL("Debug",         s:gui08, "", s:cterm08, "", "", "")
call s:HL("Directory",     s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("Error",         s:gui07, s:gui09, s:cterm07, s:cterm09, "", "")
call s:HL("ErrorMsg",      s:gui08, s:gui00, s:cterm08, s:cterm00, "", "")
call s:HL("Exception",     s:gui08, "", s:cterm08, "", "", "")
call s:HL("FoldColumn",    s:gui0C, s:gui01, s:cterm0C, s:cterm01, "", "")
call s:HL("Folded",        s:gui0F, s:gui01, s:cterm0F, s:cterm01, "", "")
call s:HL("IncSearch",     s:gui01, s:gui09, s:cterm01, s:cterm09, "none", "")
call s:HL("Italic",        "", "", "", "", "none", "")
call s:HL("Macro",         s:gui08, "", s:cterm08, "", "", "")
call s:HL("MatchParen",    s:gui00, s:gui03, s:cterm00, s:cterm03,  "", "")
call s:HL("ModeMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("MoreMsg",       s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("Question",      s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("Search",        s:gui03, s:gui0A, s:cterm03, s:cterm0A,  "", "")
call s:HL("SpecialKey",    s:gui03, "", s:cterm03, "", "", "")
call s:HL("TooLong",       s:gui08, "", s:cterm08, "", "", "")
call s:HL("Underlined",    s:gui08, "", s:cterm08, "", "", "")
call s:HL("Visual",        "", s:gui02, "", s:cterm02, "", "")
call s:HL("VisualNOS",     s:gui08, "", s:cterm08, "", "", "")
call s:HL("WarningMsg",    s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("WildMenu",      s:gui08, s:gui0A, s:cterm08, "", "", "")
call s:HL("Title",         s:gui0D, "", s:cterm0D, "", "none", "")
call s:HL("Conceal",       s:gui0D, s:gui00, s:cterm0D, s:cterm00, "", "")
call s:HL("Cursor",        s:gui00, s:gui05, s:cterm00, s:cterm05, "", "")
call s:HL("NonText",       s:gui03, "", s:cterm03, "", "", "")
call s:HL("Normal",        s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call s:HL("LineNr",        s:gui02, s:gui00, s:cterm02, s:cterm00, "", "")
call s:HL("SignColumn",    s:gui03, s:gui00, s:cterm03, s:cterm00, "bold", "")
call s:HL("StatusLine",    s:gui04, s:gui02, s:cterm04, s:cterm02, "none", "")
call s:HL("StatusLineNC",  s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call s:HL("VertSplit",     s:gui02, s:gui02, s:cterm02, s:cterm02, "none", "")
call s:HL("ColorColumn",   "", s:gui01, "", s:cterm01, "none", "")
call s:HL("CursorColumn",  "", s:gui01, "", s:cterm01, "none", "")
call s:HL("CursorLine",    "", s:gui01, "", s:cterm01, "none", "")
call s:HL("CursorLineNr",  s:gui0A, s:gui00, s:cterm0A, s:cterm00, "", "")
call s:HL("PMenu",         s:gui04, s:gui01, s:cterm04, s:cterm01, "none", "")
call s:HL("PMenuSel",      s:gui01, s:gui04, s:cterm01, s:cterm04, "", "")
call s:HL("TabLine",       s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call s:HL("TabLineFill",   s:gui03, s:gui01, s:cterm03, s:cterm01, "none", "")
call s:HL("TabLineSel",    s:gui0B, s:gui01, s:cterm0B, s:cterm01, "none", "")

" Standard syntax highlighting
call s:HL("Boolean",      s:gui09, "", s:cterm09, "", "", "")
call s:HL("Character",    s:gui08, "", s:cterm08, "", "", "")
call s:HL("Comment",      s:gui03, "", s:cterm03, "", "italic", "")
call s:HL("Conditional",  s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("Constant",     s:gui09, "", s:cterm09, "", "", "")
call s:HL("Define",       s:gui0E, "", s:cterm0E, "", "none", "")
call s:HL("Delimiter",    s:gui0F, "", s:cterm0F, "", "", "")
call s:HL("Float",        s:gui09, "", s:cterm09, "", "", "")
call s:HL("Function",     s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("Identifier",   s:gui08, "", s:cterm08, "", "none", "")
call s:HL("Include",      s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("Keyword",      s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("Label",        s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("Number",       s:gui09, "", s:cterm09, "", "", "")
call s:HL("Operator",     s:gui05, "", s:cterm05, "", "none", "")
call s:HL("PreProc",      s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("Repeat",       s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("Special",      s:gui0C, "", s:cterm0C, "", "", "")
call s:HL("SpecialChar",  s:gui0F, "", s:cterm0F, "", "", "")
call s:HL("Statement",    s:gui08, "", s:cterm08, "", "", "")
call s:HL("StorageClass", s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("String",       s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("Structure",    s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("Tag",          s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("Todo",         s:gui0A, s:gui01, s:cterm0A, s:cterm01, "", "")
call s:HL("Type",         s:gui0A, "", s:cterm0A, "", "none", "")
call s:HL("Typedef",      s:gui0A, "", s:cterm0A, "", "", "")

" C highlighting
call s:HL("cOperator",   s:gui0C, "", s:cterm0C, "", "", "")
call s:HL("cPreCondit",  s:gui0E, "", s:cterm0E, "", "", "")

" C# highlighting
call s:HL("csClass",                 s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("csAttribute",             s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("csModifier",              s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("csType",                  s:gui08, "", s:cterm08, "", "", "")
call s:HL("csUnspecifiedStatement",  s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("csContextualStatement",   s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("csNewDecleration",        s:gui08, "", s:cterm08, "", "", "")

" CSS highlighting
call s:HL("cssBraces",      s:gui05, "", s:cterm05, "", "", "")
call s:HL("cssClassName",   s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("cssColor",       s:gui0C, "", s:cterm0C, "", "", "")

" Diff highlighting
call s:HL("DiffAdd",      s:gui0B, s:gui01,  s:cterm01, s:cterm0B, "bold", "")
call s:HL("DiffChange",   s:gui03, s:gui01,  s:cterm01, s:cterm0A, "bold", "")
call s:HL("DiffDelete",   s:gui08, s:gui01,  s:cterm01, s:cterm08, "bold", "")
call s:HL("DiffText",     s:gui0D, s:gui01,  s:cterm0D, s:cterm01, "", "")
call s:HL("DiffAdded",    s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call s:HL("DiffFile",     s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")
call s:HL("DiffNewFile",  s:gui0B, s:gui00,  s:cterm0B, s:cterm00, "", "")
call s:HL("DiffLine",     s:gui0D, s:gui00,  s:cterm0D, s:cterm00, "", "")
call s:HL("DiffRemoved",  s:gui08, s:gui00,  s:cterm08, s:cterm00, "", "")

" Git highlighting
call s:HL("gitCommitOverflow",  s:gui08, "", s:cterm08, "", "", "")
call s:HL("gitCommitSummary",   s:gui0B, "", s:cterm0B, "", "", "")

" GitGutter highlighting
call s:HL("GitGutterAdd",     s:gui0B, s:gui01, s:cterm0B, s:cterm01, "", "")
call s:HL("GitGutterChange",  s:gui0D, s:gui01, s:cterm0D, s:cterm01, "", "")
call s:HL("GitGutterDelete",  s:gui08, s:gui01, s:cterm08, s:cterm01, "", "")
call s:HL("GitGutterChangeDelete",  s:gui0E, s:gui01, s:cterm0E, s:cterm01, "", "")

" HTML highlighting
call s:HL("htmlBold",    s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("htmlItalic",  s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("htmlEndTag",  s:gui05, "", s:cterm05, "", "", "")
call s:HL("htmlTag",     s:gui05, "", s:cterm05, "", "", "")

" JavaScript highlighting
call s:HL("javaScript",        s:gui05, "", s:cterm05, "", "", "")
call s:HL("javaScriptBraces",  s:gui05, "", s:cterm05, "", "", "")
call s:HL("javaScriptNumber",  s:gui09, "", s:cterm09, "", "", "")

" Mail highlighting
call s:HL("mailQuoted1",  s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("mailQuoted2",  s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("mailQuoted3",  s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("mailQuoted4",  s:gui0C, "", s:cterm0C, "", "", "")
call s:HL("mailQuoted5",  s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("mailQuoted6",  s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("mailURL",      s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("mailEmail",    s:gui0D, "", s:cterm0D, "", "", "")

" Markdown highlighting
call s:HL("markdownCode",              s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("markdownError",             s:gui05, s:gui00, s:cterm05, s:cterm00, "", "")
call s:HL("markdownCodeBlock",         s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("markdownHeadingDelimiter",  s:gui0D, "", s:cterm0D, "", "", "")

" NERDTree highlighting
call s:HL("NERDTreeDirSlash",  s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("NERDTreeExecFile",  s:gui05, "", s:cterm05, "", "", "")

" PHP highlighting
call s:HL("phpMemberSelector",  s:gui05, "", s:cterm05, "", "", "")
call s:HL("phpComparison",      s:gui05, "", s:cterm05, "", "", "")
call s:HL("phpParent",          s:gui05, "", s:cterm05, "", "", "")

" Python highlighting
call s:HL("pythonOperator",   s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("pythonRepeat",     s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("pythonBuiltin",    s:gui0A, "", s:cterm0A, "", "", "")

" Doxygen highlighting
call s:HL("doxygenBrief",                s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("doxygenSpecialOnelineDesc",   s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("doxygenSpecialHeading",       s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("doxygenParamName",            s:gui08, "", s:cterm08, "", "", "")
call s:HL("doxygenPrev",                 s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("doxygenComment",              s:gui0B, "", s:cterm0B, "", "", "")

" Ruby highlighting
call s:HL("rubyAttribute",               s:gui0D, "", s:cterm0D, "", "", "")
call s:HL("rubyConstant",                s:gui0A, "", s:cterm0A, "", "", "")
call s:HL("rubyInterpolation",           s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("rubyInterpolationDelimiter",  s:gui0F, "", s:cterm0F, "", "", "")
call s:HL("rubyRegexp",                  s:gui0C, "", s:cterm0C, "", "", "")
call s:HL("rubySymbol",                  s:gui0B, "", s:cterm0B, "", "", "")
call s:HL("rubyStringDelimiter",         s:gui0B, "", s:cterm0B, "", "", "")

" SASS highlighting
call s:HL("sassidChar",     s:gui08, "", s:cterm08, "", "", "")
call s:HL("sassClassChar",  s:gui09, "", s:cterm09, "", "", "")
call s:HL("sassInclude",    s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("sassMixing",     s:gui0E, "", s:cterm0E, "", "", "")
call s:HL("sassMixinName",  s:gui0D, "", s:cterm0D, "", "", "")

" Signify highlighting
call s:HL("SignifySignAdd",     s:gui0B, s:gui00, s:cterm0B, s:cterm00, "bold", "")
call s:HL("SignifySignChange",  s:gui0D, s:gui00, s:cterm0D, s:cterm00, "bold", "")
call s:HL("SignifySignDelete",  s:gui08, s:gui00, s:cterm08, s:cterm00, "bold", "")

" Spelling highlighting
call s:HL("SpellBad",     "", s:gui00, "", s:cterm00, "undercurl", s:gui08)
call s:HL("SpellLocal",   "", s:gui00, "", s:cterm00, "undercurl", s:gui0C)
call s:HL("SpellCap",     "", s:gui00, "", s:cterm00, "undercurl", s:gui0D)
call s:HL("SpellRare",    "", s:gui00, "", s:cterm00, "undercurl", s:gui0E)

" Remove functions
delf s:HL
delf s:GUI
delf s:CTERM

" Remove color variables
unlet s:gui00 s:gui01 s:gui02 s:gui03  s:gui04  s:gui05  s:gui06  s:gui07  s:gui08  s:gui09 s:gui0A  s:gui0B  s:gui0C  s:gui0D  s:gui0E  s:gui0F
unlet s:cterm00 s:cterm01 s:cterm02 s:cterm03 s:cterm04 s:cterm05 s:cterm06 s:cterm07 s:cterm08 s:cterm09 s:cterm0A s:cterm0B s:cterm0C s:cterm0D s:cterm0E s:cterm0F
