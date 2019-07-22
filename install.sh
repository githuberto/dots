DOTS="$(readlink -f $(dirname $0))"

add_link() {
  file="${DOTS}/${1}"
  echo "Linking ${file} to ${2}"
  ln -s "${file}" "${2}"
}

add_source() {
  command="source ${DOTS}/${1}"
  echo "Adding \"${command}\" to ${2}"
  printf "${command}\n" >> ${2}
}

add_include() {
  command="\$include ${DOTS}/${1}"
  echo "Adding \"${command}\" to ${2}"
  printf "${command}\n" >> ${2}
}

clone_repo() {
  echo "Cloning ${1} to ${2}"
  git clone ${1} ${2}
}

install() {
  # Run startup.sh on login.
  mkdir -p ~/.config/autostart/
  add_link startup.sh.desktop ~/.config/autostart/

  add_source .bashrc ~/.bashrc
  add_source .vimrc ~/.vimrc
  add_source .vim_plugins.vim ~/.vimrc
  add_source .tmux.conf ~/.tmux.conf

  add_include .inputrc ~/.inputrc

  # Install Vundle and Vim plugins.
  if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
    clone_repo https://github.com/VundleVim/Vundle.vim.git \
      ~/.vim/bundle/Vundle.vim
  fi
  vim +PluginInstall +qall

  mkdir -p ~/.vim/after/ftplugin/
  add_link python.vim ~/.vim/after/ftplugin/
}

remove() {
  echo "Removing ${1}"
  rm -rf ${1}
}

remove_include() {
  command="\$include ${DOTS}/${1}"
  echo "Removing \"${command}\" from ${2}"
  sed -i "\%${command}%d" "${2}"
}

remove_source() {
  command="source ${DOTS}/${1}"
  echo "Removing \"${command}\" from ${2}"
  sed -i "\%${command}%d" "${2}"
}

uninstall() {
  read -p "Really uninstall everything? [y/n] " i
  if [[ "$i" != "y" ]]; then
    exit 1
  fi

  remove ~/.vim/after/ftplugin/python.vim

  # Uninstall Vundle. This leaves the plugins though :(
  vim +PluginClean +qall
  remove ~/.vim/bundle/Vundle.vim

  remove_include .inputrc ~/.inputrc

  remove_source .tmux.conf ~/.tmux.conf
  remove_source .vim_plugins.vim ~/.vimrc
  remove_source .vimrc ~/.vimrc
  remove_source .bashrc ~/.bashrc

  remove  ~/.config/autostart/startup.sh.desktop
}

if [[ "$#" -ne 1 ]]; then
  echo "usage: $(basename $0) (-i | -u)" >&2
  exit 1
fi

while getopts 'iu' OPTION; do
  case "$OPTION" in
    i)
      install
      ;;
    u)
      uninstall
      ;;
    ?)
      echo "usage: $(basename $0) (-i | -u)" >&2
      exit 1
      ;;
  esac
done
