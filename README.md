How to install:

```
sudo apt install ripgrep ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen python3-venv

misc/tools.sh
./install.sh
```

Then add to your path:
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

