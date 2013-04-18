# Checks whether a command is available
check_install() {
  for i in $@; do
    hash ${i,,} >/dev/null 2>&1 || \
    { echo >&2 "$i not installed. Aborting."; exit 1; }
  done;
}

# Clones dot_vim and Vundle
clone_repo() {
  # Checks whether ~/.vim exists
  if [ -d ~/.vim ]; then
    echo -e "The \033[0;32m~/.vim\033[0m should be removed before \
    installing. Aborting." && exit 1
  fi

  GITHUB_URI="https://github.com"

  # Cloning config repo
  git clone $GITHUB_URI/bcbcarl/dot_vim.git ~/.vim || exit 1

  # Cloning Vundle
  VUNDLE_PATH=~/.vim/bundle/vundle
  git clone $GITHUB_URI/gmarik/vundle.git $VUNDLE_PATH || exit 1
}

# Generates config
config_vim() {
  # Backing up ~/.vimrc
  if [ -f ~/.vimrc ]; then
    TIMESTAMP=`date +%s`
    echo -e "\033[0;32m~/.vimrc\033[0m found."
    echo -e "Backing up to \033[0;32m~/.vimrc_$TIMESTAMP\033[0m"
    mv ~/.vimrc ~/.vimrc_$TIMESTAMP
  fi

  # Generating ~/.vimrc
  cp ~/.vim/vimrc ~/.vimrc
}

# Clones Vundle bundles
bundle_install() {
  vim -u ~/.vim/vundle.vim +BundleInstall +qall
}

# Installation requirements
check_install {"VIM","Git"}

# Cloning repos
clone_repo

# Installing bundles
bundle_install

# Configuring VIM
config_vim 

echo
echo "Installation complete. Enjoy! :-)"
echo
