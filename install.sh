# Checks requirements
depends_on() {
  for i in $@; do
    hash ${i,,} >/dev/null 2>&1 || \
    { echo >&2 "$i not installed. Aborting."; exit 1; }
  done
}

# Clones GitHub repo
github_clone() {
  git clone https://github.com/$1.git $2 || exit 1
}

# Clones config from GitHub
clone_conf() {
  # Checks whether ~/.vim exists
  if [ -d ~/.vim ]; then
    echo -e "The \033[0;32m~/.vim\033[0m should be removed before \
    installing. Aborting." && exit 1
  fi

  # Cloning config template and Vundle
  github_clone bcbcarl/dot_vim ~/.vim
  github_clone gmarik/vundle ~/.vim/bundle/vundle
}

# Generates config from template
gen_conf() {
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

install_conf() {
clone_conf
gen_conf 

echo "\nInstallation complete. Enjoy! ;-)\n"
}

depends_on {"Vim","Git"}
install_conf
