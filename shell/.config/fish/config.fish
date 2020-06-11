abbr -a c cargo
abbr -a ct 'cargo t'
abbr -a e code
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add -p'
abbr -a gaa 'git add -A'
abbr -a gm 'git commit -m'

set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin
set -U fish_user_paths $HOME/.cargo/bin

if status --is-interactive
	tmux ^ /dev/null; and exec true
end

if command -v bat > /dev/null
	abbr -a cat 'bat'
	set -g -x BAT_THEME 'base16'
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"]"
	if [ $PWD != $HOME ]
		set_color yellow
		echo -n " "(prompt_pwd)""
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color brblack
	echo -n '> '
	set_color normal
end

function fish_greeting
end

function mkt
	cd (mktemp -d /tmp/broucz-XXXXXX)
end
