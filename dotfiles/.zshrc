# Created by phallus for 5.0.2


###
## general settings
###


#prompt and syntax highlighting
function precmd { print -Pn "\e]0;%n@%M:%~\a" }
export PS1="%{[38;05;8;48;05;4m%} %(!.%S-ROOT-%s.%n) %{[38;05;4;48;05;1m%}⮀%{[00m%}%{[38;05;8;48;05;1m%} %~ %{[00m%}%{[38;05;1m%}⮀ %{[00m%}"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#fix home, del, et. al. keys
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[2~" overwrite-mode
bindkey "^[[3~" delete-char
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

#enable essentials
setopt AUTO_CD
setopt CORRECT
setopt completealiases
setopt append_history
setopt share_history
setopt hist_verify
setopt hist_ignore_all_dups
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.zshistory
setopt inc_append_history
setopt promptsubst
zstyle ':completion::complete:*' use-cache 1
autoload -U compinit && compinit

#enable 256-color mode
export TERM='rxvt-256color'

#set default editor (vim mustard rice)
export EDITOR="vim"

#start X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec xinit

#add ~/bin to $path
export PATH=~/bin:$PATH


###
## aliases
###


#ensure make uses all cores
alias make="make -j3"

#ensure cp is always recursive and verbose
alias cp='cp -Rv'

#add pretty much any font in ~/.fonts
alias fonts='mkfontdir ~/.fonts;mkfontscale ~/.fonts;xset +fp ~/.fonts;xset fp rehash;fc-cache;fc-cache -fv'

#make du pretty
alias du='cdu -d ch'

#convert flacs in dir to ogg, then move up a dir
alias f2o='flac2ogg;..'

#a bit of fun
alias fuck='echo;gayt "fuck you too";echo'
alias fucking='sudo'
alias starwars='telnet towel.blinkenlights.nl'
alias fort='fortune -a'
alias gfort='fort | gayt'

#h4x0rz ur sh1t; or ricer scripts
alias hack1='cat /dev/urandom | hexdump -c'
alias 2spooky='lua ~/stuff/2spooky.lua'
alias gentoo='lua ~/stuff/gentoo.lua'

#ls
alias ls='ls -F --color=auto'
alias la='ls -aF --color=auto'
alias ll='ls -lhF'

#pkill
alias pk='pkill'
alias pkx='sudo pkill X'

#toilet
alias gaym='toilet --gay -f mono9 -t'
alias gayf='toilet --gay -f future -t'
alias gayt='toilet --gay -f term -t'
alias metm='toilet --metal -f mono9 -t'
alias metf='toilet --metal -f future -t'
alias mett='toilet --metal -f term -t'

#git
alias ga='git add *'
alias gc='git commit -m' #remember to put commit in quotes
alias gl='git clone'
alias gp='git push origin'
alias gh='git checkout'
export gstyc=~/gitshit/user-styles/styles-clean
export gstyo=~/gitshit/user-styles/styles-old
export gconf=~/gitshit/arch-files
export g4x=~/gitshit/4chan-x

gcp() {
	case $1 in
		uc)		cp ~/.mozilla/firefox/*.default/chrome/userChrome.css $gstyc/userChrome.css;$gstyc ;;
		4chan)  	rm $gstyc/4chan.css;touch $gstyc/4chan.css;vim $gstyc/4chan.css;$gtsyc ;;
		4chan-t)	rm $gstyc/4chan-testing.css;touch $gstyc/4chan-testing.css;vim $gstyc/4chan-testing.css;$gstyc ;;
		reddit)         rm $gstyc/reddit.css;touch $gstyc/reddit.css;vim $gstyc/reddit.css;$gstyc ;;
		reddit-t)       rm $gstyc/reddit-testing.css;touch $gstyc/reddit-testing.css;vim $gstyc/reddit-testing.css;$gstyc ;;
		crshd)          cp ~/.irssi/crshd.theme $gconf/config/.irssi/crshd.theme;$gconf ;;
		zsh)		cp ~/.zshrc $gconf/dotfiles/.zshrc;$gconf ;;
		tmux)		cp ~/.tmux.conf $gconf/dotfiles/.tmux.conf;$gconf ;;
		*)		echo "$1 not found!" ;;
	esac
}


#package management
alias pu='pacman -Syu'
alias ys='yaourt'
alias yo='yaourt -Qdt'
alias yi='yaourt -S'
alias yr='yaourt -R'
alias yu='yaourt -Syy && yaourt -Syua --devel'
alias yb='yaourt -Sb'
alias yg='yaourt -G'

#vim - thanks to earsplit for this!
conf() {
	case $1 in
		mpd)		vim ~/.mpdconf ;;
		conky)		vim ~/.conkyrc ;;
		ncmpcpp)	vim ~/.ncmpcpp/config ;;
		ranger)		vim ~/.config/ranger/rc.conf ;;
		tmux)		vim ~/.tmux.conf ;;
		vim)		vim ~/.vimrc ;;
		4x)		vim $g4x/script.coffee;$g4x ;;
		xi)		vim ~/.xinitrc ;;
		xd)		vim ~/.Xdefaults ;;
		zsh)		vim ~/.zshrc && source ~/.zshrc ;;
		uc)		vim ~/.mozilla/firefox/*.default/chrome/userChrome.css ;;
		*)		echo "unknown conf: $1" ;;		
	esac
}
