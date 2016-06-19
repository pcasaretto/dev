FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get update

RUN apt-get install -y git 
RUN apt-get install -y neovim 
RUN apt-get install -y python-dev 
RUN apt-get install -y python-pip 
RUN apt-get install -y python3-dev 
RUN apt-get install -y python3-pip
RUN apt-get install -y zsh
RUN apt-get install -y vim-gtk

RUN pip3 install neovim

ENV XDG_CONFIG_HOME $HOME/.config
RUN mkdir -p $XDG_CONFIG_HOME
COPY nvim $XDG_CONFIG_HOME/nvim

RUN nvim +PlugInstall +qall
