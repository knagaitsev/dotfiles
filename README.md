How to install:

```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

sudo apt install clangd ripgrep ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen python3-venv

make
./install.sh
```

Then add to your path (if needed):
```
# bash/zsh
export PATH=~/.local/bin:$PATH

# fish
fish_add_path ~/.local/bin
```

You may need to source for tmux:
```
tmux source-file ~/.tmux.conf
```

