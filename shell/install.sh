#!/bin/sh

cd $HOME
source=$HOME/src/github/etc

ln -s $source/shell/dot.make.conf .make.conf
ln -s $source/shell/dot.zshenv .zshenv
ln -s $source/shell/dot.zshrc .zshrc
ln -s $HOME/.oh-my-zsh oh-my-zsh
mkdir $HOME/.zsh

rm -f $HOME/.zshrc
cd $HOME/.zsh
i=0
for file in $source/shell/dot.zsh/*
do
    index=`printf %02d $i`
    ln -s $file $index.$file
    (( i = 1 + $i ))
done

cd $HOME
for file in $source/config/*
do
    base=`basename $file | sed 's/dot//'`
    ln -s $file $base
done

rm -f .gitconfig
cp $source/config/dot.gitconfig .gitconfig
echo -n git username:' '
read username
git config --global user.name "$username"
echo -n git email:' '
read email
git config --global user.email "$email"
