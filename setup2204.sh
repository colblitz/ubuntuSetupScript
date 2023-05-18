#!/bin/bash

# initially based on http://blog.self.li/post/74294988486/creating-a-post-installation-script-for-ubuntu

sudo apt -y update
sudo apt -y upgrade

sudo apt -y install git curl vim wget gnome-tweaks ubuntu-restricted-extras vlc steam wine htop

#sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt install sublime-text sublime-merge

# dropbox - manually install

# google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc

# node
nvm install node

# npm
sudo apt install npm

# mongo
sudo apt install gnupg
curl -fsSL https://pgp.mongodb.com/server-6.0.asc |    sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg    --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod

# ~/.gitconfig
[user]
	name = Joseph Lee
	email = z.joseph.lee.z@gmail.com
[color]
	ui = true
[core]
	pager = cat
	editor = vim
[pager]
	diff = false
[alias]
	out = !git log origin/master..$(git rev-parse --abbrev-ref HEAD)

# ~/.bashrc

# ~/.vimrc
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

################################################################################################
################################################################################################





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