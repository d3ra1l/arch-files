# Created by phallus for 5.0.2


###
## general settings
###


#prompt and syntax highlighting
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


#ensure make uses all cores (tfw I didn't realize my comp was quad-core until very recently)
alias make="make -j5"

#ensure cp is always recursive and verbose
alias cp='cp -Rv'

#add pretty much any font in ~/.fonts
alias fonts='mkfontdir ~/.fonts;mkfontscale ~/.fonts;xset +fp ~/.fonts;xset fp rehash;fc-cache;fc-cache -fv'

#make du pretty
alias du='cdu -d ch'

#conversion
alias f2o='flac2ogg;..'
alias a2f='for f in *.m4a; do ffmpeg -i "$f" "${f%.m4a}.flac"; done;rm *.m4a'

#a bit of fun
alias fuck='echo;gayt "fuck you too";echo'
alias fucking='sudo'
alias starwars='telnet towel.blinkenlights.nl'
alias fort='fortune -a'
alias gfort='fort | gayt'
alias hack='cat /dev/urandom | hexdump -c'

#screenfetch
alias sfd='screenfetch-dev'
alias sfu='screenfetch-ulf'

#byzanz
record() {
	byzanz-record --duration=$1 --delay=$2 $3.gif
}
alias byz="record"

#music
alias mpd='mpd;mpdscribble'
alias mps='mpdscribble'
alias ncp='ncmpcpp'
alias eq='alsamixer -D equal'
alias f2k='wine ~/.wine/drive_c/users/phallus/Desktop/foobar2000/foobar2000.exe'

#nitrogen
alias nr='nitrogen --restore'

#ls
alias ls='ls -F --color=auto'
alias la='ls -aF --color=auto'
alias ll='ls -lhF'

#archives
extract () {
	if [ -f $1 ] ; then
		case $1 in
		tar)	tar xf $1;;
		rar)	unrar x $1;;
		7z)		7za e $1;;
		zip)	unzip $1;;
		*)		echo "idk how to extract this lol";;
		esac
	else
		echo "invalid file you baka"
	fi
}


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
export gfo=~/gitshit/fonts
export g4x=~/gitshit/4chan-x

gcp() {
	case $1 in
		uc)			cp ~/.mozilla/firefox/*.default/chrome/userChrome.css $gstyc/userChrome.css;$gstyc ;;
		uc-t)       cp ~/.mozilla/firefox/*.default/chrome/userChrome.css $gstyc/userChrome-testing.css;$gstyc ;;
		4chan)  	rm $gstyc/4chan.css;touch $gstyc/4chan.css;vim $gstyc/4chan.css;$gtsyc ;;
		4chan-t)	rm $gstyc/4chan-testing.css;touch $gstyc/4chan-testing.css;vim $gstyc/4chan-testing.css;$gstyc ;;
		reddit)     rm $gstyc/reddit.css;touch $gstyc/reddit.css;vim $gstyc/reddit.css;$gstyc ;;
		reddit-t)   rm $gstyc/reddit-testing.css;touch $gstyc/reddit-testing.css;vim $gstyc/reddit-testing.css;$gstyc ;;
		crshd)      cp ~/.irssi/crshd.theme $gconf/config/.irssi/crshd.theme;$gconf ;;
		zsh)		cp ~/.zshrc $gconf/dotfiles/.zshrc;$gconf ;;
        vim)        cp ~/.vimrc $gconf/dotfiles/.vimrc;$gconf ;;
        vimp)       cp ~/.vimperatorrc $gconf/dotfiles/.vimperatorrc;$gconf ;;
		ncp) 		cp ~/.ncmpcpp/config $gconf/dotfiles/ncmpcpp-config;$gconf ;;
		tmux)		cp ~/.tmux.conf $gconf/dotfiles/.tmux.conf;$gconf ;;
		lemon)		cp ~/.fonts/bdf/lemon.bdf $gfo/lemon.bdf;$gfo ;;
		uushi)		cp ~/.fonts/bdf/uushi.bdf $gfo/uushi.bdf;$gfo ;;
		*)			echo "$1 not found!" ;;
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

#ranger
rn() {
        case $1 in     
                awesome)        ranger ~/.config/awesome ;;
                torrents)       ranger ~/torrents ;;
                music)          ranger ~/mu ;;
                bin)            ranger ~/bin ;;
                git)            ranger ~/gitshit ;;
				*)				ranger ;;
        esac
}

#vim - thanks to earsplit for this!
conf() {
	case $1 in
		mpd)		vim ~/.mpdconf ;;
		conky)		vim ~/.conkyrc ;;
		ncp)    	vim ~/.ncmpcpp/config ;;
		rn)		    vim ~/.config/ranger/rc.conf ;;
		tmux)		vim ~/.tmux.conf ;;
		vim)		vim ~/.vimrc ;;
		xi)			vim ~/.xinitrc ;;
		xd)			vim ~/.Xdefaults ;;
		zsh)		vim ~/.zshrc && source ~/.zshrc ;;
		uc)			vim ~/.mozilla/firefox/*.default/chrome/userChrome.css ;;
		i3)			vim ~/.i3/config ;;
		irssi)		vim ~/.irssi/config ;;
		crshd)		vim ~/.irssi/crshd.theme ;;
		lemon)		~/.fonts/bdf;gbdfed;vim lemon.bdf;bdftopcf -o ../lemon.pcf lemon.bdf ;;
		uushi)		~/.fonts/bdf;gbdfed;bdftopcf -o ../uushi.pcf uushi.bdf ;;
		awesome)	vim ~/.config/awesome/rc.lua ;;
        gtk)        vim ~/.themes/Kvtie/gtk-2.0/gtkrc ;;
        pacman)     sudo vim /etc/pacman.conf ;;
		vimp)		vim ~/.vimperatorrc ;;
		*)			echo "unknown conf: $1" ;;		
	esac
}
