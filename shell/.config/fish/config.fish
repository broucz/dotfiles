# docker

abbr -a dprune 'docker system prune -a -f --volumes'
abbr -a drmid 'docker rmi -f (docker images -f "dangling=true" -q)'

# Exa
abbr -a tre 'exa --tree'
abbr -a trel 'exa --tree --long'

# General
abbr -a e codium
abbr -a re_source 'source ~/.config/fish/config.fish'
abbr -a vim 'nvim'

# Git
abbr -a ga 'git add -p'
abbr -a gba 'git fetch -p origin && git branch -a'
abbr -a gc 'git commit'
abbr -a gcb 'git checkout -b'
abbr -a gclean 'git branch --merged origin/main | grep -v main | xargs git branch -d'
abbr -a gcm 'git checkout main'
abbr -a gco 'git checkout'
abbr -a gd 'git --no-pager diff --patch-with-stat'
abbr -a gf 'git fetch -p origin'
abbr -a gfp 'git fetch -p origin && git pull -p && git branch -a'
abbr -a gl 'git log --pretty=oneline -n 20 --graph --abbrev-commit'
abbr -a gm 'git commit -m'
abbr -a gs 'git status -s'

# Github
abbr -a ghx 'gh '

# Rust
abbr -a c cargo
abbr -a ct 'cargo t'
abbr -a cc 'cargo c'

set -U fish_user_paths /usr/local/sbin /usr/local/bin /usr/bin /bin $fish_user_paths
set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/.dotfiles/bin $fish_user_paths

# Node

set -g fish_user_paths "/opt/homebrew/opt/node@14/bin" $fish_user_paths

# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

if command -v bat > /dev/null
	abbr -a cat 'bat'
	set -g -x BAT_THEME 'base16'
end

if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

setenv CARGO_INCREMENTAL 1
#if test -e ~/.cargo-target
#	setenv CARGO_TARGET_DIR ~/.cargo-target
#end

function mk
	command mkdir -p $argv
	cd $argv
end

function mkt
	cd (mktemp -d /tmp/XXXXXX)
end

function gaa
  git add -A
	git commit -m $argv
end

function weekly
	dotfiles
	fisher update
	rustup update
end
