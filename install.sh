#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: Simple script for create links .vimrc and .vim/ and some folders
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Alex Lov <alex@alexlov.com>
#  ORGANIZATION: 
#       CREATED: 04/18/2012 22:39:29 MSK
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

## get fullpath to script itself
pushd `dirname $0` > /dev/null
DOTVIM_DIR=`pwd -P`
popd > /dev/null

VIM_DIR=$HOME/.vim
VIMRC=$HOME/.vimrc

## TODO: if old .vimrc and .vim is symlink to dotvim/..., don't do anything
## if file ~/.vimrc exist then create backup
[[ -e $VIMRC ]] && mv $VIMRC ${VIMRC}.old
## create symlink
ln -s $DOTVIM_DIR/vimrc $VIMRC

## same for .vim directory
[[ -d $VIM_DIR ]] && mv $VIM_DIR ${VIM_DIR}.old
ln -s $DOTVIM_DIR/vim $VIM_DIR

## check folders im $VIM_DIR and if not exist make it
[[ -d ${VIM_DIR}/bundle ]]  || mkdir ${VIM_DIR}/bundle
[[ -d ${VIM_DIR}/tmp ]]     || mkdir -p ${VIM_DIR}/tmp/{backup,ctrlp,swap,undo}
[[ -d ${VIM_DIR}/private ]] || mkdir -p ${VIM_DIR}/private/gist/cookies


