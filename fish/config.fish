# Remove the greeting from the fish prompt on first open
set fish_greeting ""
export TERM="xterm-256color"

fish_add_path ~/.local/bin

oh-my-posh init fish --config ~/.config/fish/themes/tonybaloney.omp.json | source
oh-my-posh disable notice

fish_config theme choose "Tomorrow Night Bright"

# alias sshadd 'bash; eval "$(ssh-agent)"; ssh-add;'
alias sshadd 'eval (ssh-agent -c); ssh-add;'

# local
set -l script_path ~/.config/fish/scripts

alias g $script_path/g.sh

alias gis "git status"
alias gia "git add"
alias gic "git commit -m"
alias gip "git push"
# alias gp $script_path/gp.sh
alias gp 'if test -z "$SSH_AGENT_PID"; eval (ssh-agent -c) && ssh-add; end && git pull'

# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"
#
# set -e LD_INCLUDE_PATH
#
# switch (uname)
# # Specific things to my mac
# 	case Darwin
# 		export C_INCLUDE_PATH="/opt/homebrew/include:$C_INCLUDE_PATH"
# 		export CFLAGS="-I/opt/homebrew/include"
# 		export LDFLAGS="-L/opt/homebrew/lib"
# 		export PATH="/opt/homebrew/bin:$PATH"
# end
#
#
# set -x GOPATH $HOME/dev/go
#
# export PATH="$GOPATH/bin:$PATH"
# export PATH="/opt/cuda/bin:$PATH"
#
# set -g fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/.cargo/bin $fish_user_paths
#
# export EDITOR=(which nvim)
# export RVTC="~/chariot/toolchain/local/bin/riscv64-elf-"
#
# alias cft "vim ~/dotfiles/tmux/tmux.conf"
# alias cff "vim ~/dotfiles/fish/config.fish"
#
# alias vim="nvim"
# alias vi="nvim"
# alias oldvim="vim"
#
# alias tm "tmux new-session -A -s main"
# alias :q "exit"
# alias glog "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
#
# alias lg "lazygit"
# alias lx "exa -lgaFBS"
#
# alias gp "git push"
# alias gP "git pull"
# alias gc "git commit"
# alias gs "git status"
# alias gsw "git switch"
#
# # disable homebrew auto update. Not sure if this works
# set -x HOMEBREW_NO_AUTO_UPDATE 1
# set HOMEBREW_NO_AUTO_UPDATE 1
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
#
#
# set -g hydro_color_pwd yellow
# set -g hydro_color_prompt green
# set -g hydro_color_error red
#
# set -g fish_color_normal normal
# set -g fish_color_command ffffff
# set -g fish_color_quote a8a8a8
# set -g fish_color_redirection 808080
# set -g fish_color_end 949494
# set -g fish_color_error 585858
# set -g fish_color_param d7d7d7
# set -g fish_color_comment bcbcbc
# set -g fish_color_match --background=brblue
# set -g fish_color_selection white --bold --background=brblack
# set -g fish_color_search_match bryellow --background=brblack
# set -g fish_color_history_current --bold
# set -g fish_color_operator 00a6b2
# set -g fish_color_escape 00a6b2
# set -g fish_color_cwd green
# set -g fish_color_cwd_root red
# set -g fish_color_valid_path --underline
# set -g fish_color_autosuggestion 777777
# set -g fish_color_user brgreen
# set -g fish_color_host normal
# set -g fish_color_cancel -r
# set -g fish_pager_color_completion normal
# set -g fish_pager_color_description B3A06D yellow
# set -g fish_pager_color_prefix white --bold --underline
# set -g fish_pager_color_progress brwhite --background=cyan
#
# set -gx PNPM_HOME "/Users/nick/Library/pnpm"
# set -gx PATH "$PNPM_HOME" $PATH
#
# # opam configuration
# source /Users/nick/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# source ~/dotfiles/fish/iterm.fish; or true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f ~/miniconda3/bin/conda
    eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source

    conda config --set changeps1 False
		conda activate base
#		conda config --set auto_activate_base false
end
# <<< conda initialize <<<

bind \t 'if not commandline -P; commandline -f complete; end'

if test -f "$HOME/.cargo/env"
    bass source "$HOME/.cargo/env"
end

