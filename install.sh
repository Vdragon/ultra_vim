#!/bin/sh

# Checks requirements
depends_on() {
  for i in $@; do
    hash $i >/dev/null 2>&1 || {
      echo >&2 "$i not installed. Aborting."; exit 1; }
  done
}

# Clones GitHub repo
github_clone() { git clone https://github.com/$1.git $2 || exit 1; }

# Clones configs
clone_config() {
  # Checks whether ~/.vim exists
  if [ -d ~/.vim ]; then
    echo -e "The ~/.vim should be removed before installing. Aborting."; exit 1
  fi

  # Cloning configs template and Vundle
  github_clone bcbcarl/ultra_vim ~/.vim
  github_clone gmarik/vundle ~/.vim/bundle/vundle
}

# Generates configs
make_config() {
  # Installing bundles
  vim -u ~/.vim/vundle.vim +BundleInstall +qall 2>&1

  # Backing up ~/.vimrc
  if [ -f ~/.vimrc ]; then
    TIMESTAMP=`date +%s`
    echo -e "~/.vimrc found."
    echo -e "Backing up to ~/.vimrc_$TIMESTAMP"
    mv ~/.vimrc ~/.vimrc_$TIMESTAMP
  fi

  # Generating ~/.vimrc
  cp ~/.vim/vimrc ~/.vimrc
}

# Installs configs and plugins
install_config() {
  clone_config
  make_config
  echo "\nInstallation complete. Enjoy! ;-)\n"
}

depends_on vim git
install_config
