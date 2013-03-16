# Created by newuser for 5.0.2

PROMPT="%{$fg[blue]%}~>%{$fg_bold[blue]%}> "
RPROMPT="%{$reset_color%}"
#. /usr/share/zsh/site-contrib/powerline.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#enable awesomeness
setopt AUTO_CD
setopt CORRECT
autoload -U compinit
compinit

#fix home, end, et. al. keys
#--nothing yet ;_;

#set default editor (vim mustard rice)
export EDITOR="vim"

#start X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit

#add ~/bin to $path
export PATH=~/bin:$PATH

#add pretty much any font in ~/.fonts
alias fonts='mkfontdir ~/.fonts;mkfontscale ~/.fonts;xset +fp ~/.fonts;xset fp rehash;fc-cache;fc-cache -fv'

#take a screenshot
alias scr='scrot -d2 penis.png;pngcrush penis.png benis.png;rm -r penis.png'
alias scrv='scrot -cd5 penis.png;pngcrush penis.png benis.png;rm -r penis.png'

#make du pretty
alias du='cdu -d ch'

#h4x0rz ur sh1t
alias hack='cat /dev/urandom | hexdump -c'
alias 2spooky='lua ~/stuff/2spooky.lua'
alias gentoo='lua ~/sfuff/gentoo.lua'

#alias for pkill
alias pk='pkill'
alias pkx='sudo pkill X'

#toilet
alias gaym='toilet --gay -f mono9 -t'
alias gayf='toilet --gay -f future -t'
alias gayt='toilet --gay -f term -t'

#convert flacs in dir to ogg, then move up a dir
alias f2o='flac2ogg;..'

#package management
alias pu='pacman -Syu'
alias ys='yaourt'
alias yo='yaourt -Qdt'
alias yi='yaourt -S'
alias yr='yaourt -R'
alias yu='yaourt -Syy && yaourt -Syua --devel'
alias yb='yaourt -Sb'
alias yg='yaourt -G'

