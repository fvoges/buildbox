#!/bin/bash

mkdir -p ~/src
cd ~/src
git clone https://github.com/fvoges/puppetlabs-rcfiles.git
cd puppetlabs-rcfiles
./install.sh

git config --global user.name "Federico Voges"
git config --global user.email federico@puppetlabs.com
git config --global credential.helper cache
git config --global color.diff auto
git config --global alias.hist 'log --pretty=format:"%h %ad | %s%d [%an <%ae>]" --graph --date=short'
git config --global alias.a add
git config --global alias.aa 'add -A'
git config --global alias.bv 'branch -avv'
git config --global alias.c commit
git config --global alias.ca 'commit -a'
git config --global alias.cam 'commit -a -m'
git config --global alias.co checkout
git config --global alias.d diff
git config --global alias.ds 'diff --stat'
git config --global alias.l 'log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
git config --global alias.l1 'log --pretty=oneline'
git config --global alias.m 'commit -m'
git config --global alias.s status
git config --global alias.cp 'cherry-pick'
git config --global alias.pa 'push --all'
git config --global alias.p 'push origin'

