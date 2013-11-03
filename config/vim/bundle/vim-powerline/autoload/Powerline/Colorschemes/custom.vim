call Pl#Hi#Allocate({
\ 'black' : 235,
\ 'white' : 0,
\ 'termdblack' : 7,
\ 'termlblack' : 15,
\ 'termdred' : 1,
\ 'termlred' : 9,
    \ 'termdyellow' : 3,
    \ 'termlyellow' : 11,
\ 'termdwhite' : 0,
\ 'termlwhite' : 8,
    \ 'termlcyan' : 14,
    \ 'termdcyan' : 6,
    \ 'termlblue' : 12,
    \ 'termdblue' : 4,
    \ 'termlgreen' : 10,
    \ 'termdgreen' : 2,
\
\ 'darkestgreen' : 235,
\ 'darkgreen' : 235,
\ 'mediumgreen' : 235,
\ 'brightgreen' : 235,
\
\ 'darkestcyan' : 23,
\ 'mediumcyan' : 117,
\
\ 'darkestblue' : 24,
\ 'darkblue' : 31,
\
\ 'darkestred' : 1,
\ 'darkred' : 1,
\ 'mediumred' : 1,
\ 'brightred' : 9,
\ 'brightestred' : 9,
\
\ 'darkestpurple' : 7,
\ 'mediumpurple' : 235,
\ 'brightpurple' : 7,
\
\ 'brightorange' : 208,
\ 'brightestorange': 214,
\
\ 'gray0' : 233,
\ 'termddblack' : 234,
\ 'gray1' : 235,
\ 'gray2' : 236,
\ 'gray3' : 239,
\ 'gray4' : 240,
\ 'gray5' : 241,
\ 'gray6' : 244,
\ 'gray7' : 245,
\ 'gray8' : 247,
\ 'gray9' : 250,
\ 'gray10' : 252,
\ })

let g:Powerline#Colorschemes#custom#colorscheme = Pl#Colorscheme#Init([
\ Pl#Hi#Segments(['SPLIT'], {
\ 'n': ['white', 'termdblack'],
\ 'N': ['white', 'termdblack'],
\ 'i': ['white', 'termdblack'],
\ }),
\
\ Pl#Hi#Segments(['mode_indicator'], {
\ 'n': ['termlwhite', 'termdblue'],
\ 'i': ['termlwhite', 'termdred'],
\ 'v': ['termdblack', 'brightorange'],
\ 'r': ['gray10', 'mediumred'],
\ 's': ['white', 'gray5'],
\ }),
\
\ Pl#Hi#Segments(['scrollpercent', 'raw', 'filesize'], {
\ 'n': ['termdblack', 'termlwhite'],
\ 'N': ['termdblack', 'termlwhite'],
\ 'i': ['termdblack', 'termlwhite'],
\ }),
    \
    \ Pl#Hi#Segments(['branch'], {
       \ 'n': ['termlwhite', 'black'],
       \ 'N': ['termdwhite', 'termdblack'],
       \ 'i': ['white', 'termdblack'],
       \ }),
\
\ Pl#Hi#Segments(['fileinfo', 'filename'], {
\ 'n': ['termdwhite', 'termdblack'],
\ 'N': ['termdwhite', 'termdblack'],
\ 'i': ['termdwhite', 'termdblack'],
\ 'v': ['termdwhite', 'termdblack'],
\ }),
\
\ Pl#Hi#Segments(['fileinfo.filepath'], {
\ 'n': ['termdwhite'],
\ 'N': ['termdwhite'],
\ 'i': ['termlwhite'],
\ }),
\
\ Pl#Hi#Segments(['static_str'], {
\ 'n': ['termdwhite', 'termdblack'],
\ 'N': ['termdwhite', 'termdblack'],
\ 'i': ['termlwhite', 'termdblack'],
\ }),
\
\ Pl#Hi#Segments(['fileinfo.flags'], {
\ 'n': ['termdred'],
\ 'N': ['termdred'],
\ 'i': ['termdred'],
\ }),
\
\ Pl#Hi#Segments(['currenttag', 'fullcurrenttag', 'fileformat', 'fileencoding', 'pwd', 'filetype', 'rvm:string', 'rvm:statusline', 'virtualenv:statusline', 'charcode', 'currhigroup'], {
\ 'n': ['termdwhite', 'termdblack'],
\ 'i': ['termdwhite', 'termdblack'],
\ }),
\
\ Pl#Hi#Segments(['lineinfo'], {
\ 'n': ['termdblack', 'termlwhite'],
\ 'N': ['termdblack', 'termlwhite'],
\ 'i': ['termdblack', 'termlwhite'],
\ }),
\
\ Pl#Hi#Segments(['errors'], {
\ 'n': ['brightestorange', 'gray2'],
\ 'i': ['brightestorange', 'darkestblue'],
\ }),
\
\ Pl#Hi#Segments(['lineinfo.line.tot'], {
\ 'n': ['termlblack'],
\ 'N': ['termlblack'],
\ 'i': ['termlblack'],
\ }),
\
\ Pl#Hi#Segments(['paste_indicator', 'ws_marker'], {
\ 'n': ['termlwhite', 'brightred'],
\ }),
\
\ Pl#Hi#Segments(['gundo:static_str.name', 'command_t:static_str.name'], {
\ 'n': ['white', 'mediumred'],
\ 'N': ['brightred', 'darkestred'],
\ }),
\
\ Pl#Hi#Segments(['gundo:static_str.buffer', 'command_t:raw.line'], {
\ 'n': ['white', 'darkred'],
\ 'N': ['brightred', 'darkestred'],
\ }),
\
\ Pl#Hi#Segments(['gundo:SPLIT', 'command_t:SPLIT'], {
\ 'n': ['white', 'darkred'],
\ 'N': ['white', 'darkestred'],
\ }),
\
\ Pl#Hi#Segments(['lustyexplorer:static_str.name', 'minibufexplorer:static_str.name', 'nerdtree:raw.name', 'tagbar:static_str.name'], {
\ 'n': ['white', 'mediumgreen'],
\ 'N': ['mediumgreen', 'darkestgreen'],
\ }),
\
\ Pl#Hi#Segments(['lustyexplorer:static_str.buffer', 'tagbar:static_str.buffer'], {
\ 'n': ['brightgreen', 'darkgreen'],
\ 'N': ['mediumgreen', 'darkestgreen'],
\ }),
\
\ Pl#Hi#Segments(['lustyexplorer:SPLIT', 'minibufexplorer:SPLIT', 'nerdtree:SPLIT', 'tagbar:SPLIT'], {
\ 'n': ['white', 'darkgreen'],
\ 'N': ['white', 'darkestgreen'],
\ }),
\
\ Pl#Hi#Segments(['ctrlp:focus', 'ctrlp:byfname'], {
\ 'n': ['brightpurple', 'darkestpurple'],
\ }),
\
\ Pl#Hi#Segments(['ctrlp:prev', 'ctrlp:next', 'ctrlp:pwd'], {
\ 'n': ['white', 'mediumpurple'],
\ }),
\
\ Pl#Hi#Segments(['ctrlp:item'], {
\ 'n': ['darkestpurple', 'white'],
\ }),
\
\ Pl#Hi#Segments(['ctrlp:marked'], {
\ 'n': ['brightestred', 'darkestpurple'],
\ }),
\
\ Pl#Hi#Segments(['ctrlp:count'], {
\ 'n': ['darkestpurple', 'white'],
\ }),
\
\ Pl#Hi#Segments(['ctrlp:SPLIT'], {
\ 'n': ['white', 'darkestpurple'],
\ }),
\ ])


