#!/bin/bash

# initially based on http://blog.self.li/post/74294988486/creating-a-post-installation-script-for-ubuntu

# add repos
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main"

sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

sudo apt-get -y install \
	git \
	sublime-text-installer \
	dropbox \
	curl \
	google-chrome-stable \
	vim \

# nvm - https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash

# node
nvm install node

# npm
sudo apt-get install npm

# mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# start mongo - create /data/db
sudo service mongod start

# add settings

# bash ~/.bashrc

# git ~/.gitconfig
user.name=colblitz
user.email=z.joseph.lee.z@gmail.com
credential.helper=cache --timeout=36000
pager.diff=false
color.ui=true
core.editor=vim
core.pager=cat
alias.out=!git log origin/master..$(git rev-parse --abbrev-ref HEAD)

# vim ~/.vimrc
set number
set ts=4

syntax on " Turn on syntax highlighting
set showmatch " Show matching braces when text indicator is over them

" Switch on filetype detection and loads
" indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent " Copy indent from the row above
set si " Smart indent

set nu

:command WQ wq
:command Wq wq
:command W w
:command Q q


# folders
rm -rf ~/Documents
rm -rf ~/Music
rm -rf ~/Pictures
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Examples
mkdir ~/projects

# git clone

# prompt for a reboot
clear
echo ""
echo "===================="
echo " TIME FOR A REBOOT! "
echo "===================="
echo ""