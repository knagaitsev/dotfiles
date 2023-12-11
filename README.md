How to install:

```
sudo apt install ripgrep ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen python3-venv

misc/tools.sh
./install.sh
```

You may need to source for tmux:
```
tmux source-file ~/.tmux.conf
```

Put this in your `~/.bashrc` to save history from tmux in `history` command:
```
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
```

Add ssh deploy key:
```
ssh-keygen -C "int_traces" -f ~/.ssh/int_traces -t ed25519
GIT_SSH_COMMAND='ssh -i ~/.ssh/int_traces' git clone git@github.com:knagaitsev/dotfiles.git
git config --add --local core.sshCommand 'ssh -i ~/.ssh/int_traces'
```

