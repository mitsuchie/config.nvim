#!/bin/bash

DIR=$(cd $(dirname $0);pwd)
mkdir $DIR/cache
git clone https://github.com/Shougo/dein.vim.git $DIR/dein/repos/github.com/Shougo/dein.vim
