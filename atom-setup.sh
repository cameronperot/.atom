#!/bin/bash

# initialize variables
url="https://github.com/atom/atom/releases/download/v1.35.1/atom.x86_64.rpm"
file="atom.x86_64.rpm"
dir="$HOME/atom-config"

# clone the repository
git clone https://github.com/cameronperot/atom-config.git $dir
cd $dir

# download/install atom
wget -O $file $url
sudo rpm -i $file
rm $file

# install the packages from the list
apm install --packages-file $dir/package.list

# copy over setup files
mv $dir/* $HOME/.atom/
mv $dir/.git/ $HOME/.atom/
mv $dir/.gitignore $HOME/.atom/
rm -rf $dir
