#!/usr/bin/env bash

# If anything fails, exit right away
set -e

ROOT=$HOME/.local/toolbuild

mkdir -p $ROOT



function buildstep {
    NAME=$1
    shift
    "$@" 2>&1 | sed $'s|^|\x1b[34m['"${NAME}"$']\x1b[39m |' || exit 1
}

function fetch {
	if [ ! -d $1 ]; then
		git clone --depth 1 $2 $1 --branch $3
	fi
}

# 
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.local/lib"
export LD_RUN_PATH="$LD_RUN_PATH:$HOME/.local/lib"

pushd $ROOT

fetch neovim https://github.com/neovim/neovim.git v0.9.4
pushd neovim
	buildstep "neovim/build" make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$HOME/.local
	buildstep "neovim/install" make install
popd

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

mkdir -p ~/.tmux/plugins/tpm
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

curl -sfLS https://install-node.vercel.app | bash -s 20 -y --prefix=$HOME/.local
# $HOME/.local/bin/npm install --global yarn

# fetch libevent https://github.com/libevent/libevent.git
# pushd libevent
# 	[ ! -f configure ] && buildstep "libevent/autoconf" sh autogen.sh
# 	buildstep "libevent/configure" ./configure --prefix=$HOME/.local
# 	buildstep "libevent/build" make -j $(nproc)
# 	buildstep "libevent/install" make install
# popd

# fetch tmux https://github.com/tmux/tmux.git
# pushd tmux
# 	buildstep "tmux/autoconf" sh autogen.sh
# 	buildstep "tmux/configure" ./configure --prefix=$HOME/.local CFLAGS="-L$HOME/.local/lib"
# 	buildstep "tmux/build" make -j $(nproc)
# 	buildstep "tmux/install" make install
# popd

popd >/dev/null


