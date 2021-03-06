#!/bin/sh

cd $HOME
source=$HOME/src/github/etc

rm -f $HOME/.zshrc
ln -s $source/shell/dot.make.conf .make.conf
ln -s $source/shell/dot.zshenv .zshenv
ln -s $source/shell/dot.zshrc .zshrc
ln -s $HOME/.oh-my-zsh oh-my-zsh
mkdir $HOME/.zsh

cd $HOME/.zsh
i=0
for file in $source/shell/dot.zsh/*.zsh
do
    index=`printf %02d $i`
    base=`basename $file`
    ln -s $file $index.$base
    i=`expr 1 + $i`
done
touch 99.local.zsh

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
