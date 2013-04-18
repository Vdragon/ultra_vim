# Checks whether a command is available
check_install() {
  for i in $@; do
    hash ${i,,} >/dev/null 2>&1 || \
    { echo >&2 "$i not installed. Aborting."; exit 1; }
  done
}

# Clones GitHub repo
github_clone() {
  git clone https://github.com/$1.git $2 || exit 1
}

# Clones dot_vim and Vundle
clone_repo() {
  # Checks whether ~/.vim exists
  if [ -d ~/.vim ]; then
    echo -e "The \033[0;32m~/.vim\033[0m should be removed before \
    installing. Aborting." && exit 1
  fi

  # Cloning config
  github_clone bcbcarl/dot_vim ~/.vim

  # Cloning Vundle
  github_clone gmarik/vundle ~/.vim/bundle/vundle
}

# Generates config from template
config_vim() {
  # Installing bundles
  vim -u ~/.vim/vundle.vim +BundleInstall +qall

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

# Installation requirements
check_install {"Vim","Git"}

# Cloning repos
clone_repo

# Configuring Vim
config_vim 

echo
echo "Installation complete. Enjoy! :-)"
echo
