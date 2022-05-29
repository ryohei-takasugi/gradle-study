FROM openjdk:11-oraclelinux8
# set version number
ARG gradleVersion="7.0"
# set the directory to execute the command
RUN mkdir /opt/gradle
WORKDIR /opt/gradle
# install common library
RUN microdnf update && microdnf upgrade && microdnf install yum vim unzip zip
RUN yum update && yum upgrade && yum install -y /usr/bin/xargs
# install gradle
RUN curl -sSOL "https://services.gradle.org/distributions/gradle-${gradleVersion}-bin.zip"
RUN unzip -d /opt/gradle gradle-${gradleVersion}-bin.zip
ENV PATH /opt/gradle/gradle-${gradleVersion}/bin:$PATH
RUN touch /root/.bashrc
RUN gradle -v
# set bash
RUN echo "PS1='[\[\033[01;32m\]\u@Gradle\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \@]\$ '" >> /root/.bashrc
RUN echo "alias ls='ls --color=auto'" >> /root/.bashrc
RUN echo "alias ll='ls -la --color=auto'" >> /root/.bashrc
RUN echo "alias lt='ls -tl --color=auto'" >> /root/.bashrc
RUN echo "alias diff='diff --color=auto'" >> /root/.bashrc
RUN echo "alias ip='ip -color=auto'" >> /root/.bashrc
RUN echo "alias grdl='./gradlew \$@'" >>  /root/.bashrc
# set vim
RUN echo '" ---- my config ----' >> /etc/vimrc
RUN echo '" set basic' >> /etc/vimrc
RUN echo "set encoding=utf-8" >> /etc/vimrc
RUN echo "set nobackup" >> /etc/vimrc
RUN echo "set number" >> /etc/vimrc
RUN echo "set title" >> /etc/vimrc
RUN echo "set showcmd" >> /etc/vimrc
RUN echo "set laststatus=2" >> /etc/vimrc
RUN echo "set ruler" >> /etc/vimrc
RUN echo '" set syntax' >> /etc/vimrc
RUN echo "syntax on" >> /etc/vimrc
RUN echo "set showmatch" >> /etc/vimrc
RUN echo '" set search' >> /etc/vimrc
RUN echo "set hlsearch" >> /etc/vimrc
RUN echo "set smartcase" >> /etc/vimrc
RUN echo "set ignorecase" >> /etc/vimrc
RUN echo "set incsearch" >> /etc/vimrc
RUN echo '" set tab' >> /etc/vimrc
RUN echo "set noautoindent" >> /etc/vimrc
RUN echo "set expandtab" >> /etc/vimrc
