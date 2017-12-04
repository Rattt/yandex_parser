FROM fedora:25
MAINTAINER Moroz Ivan "genom-1990@yandex.ru"
LABEL maintainer="genom-1990@yandex.ru"

# Environmental variables
ENV APP_NAME=webapp
ENV APP_USER=rails_user
ENV APP_GROUP=rails_user
ENV HOME=/home/rails_user
ENV RUBY_VERSION=2.4.1
ENV APP_DIR=/home/rails_user/www 

RUN dnf update -y
RUN dnf -y groupinstall "Development Tools"
RUN dnf -y install cronie
RUN dnf install nodejs -y
RUN dnf install gcc-c++ patch readline readline-devel zlib zlib-devel \
    libyaml-devel libffi-devel openssl-devel make \
    bzip2 autoconf automake libtool bison gcc glibc sqlite-devel \
    postgresql-devel ruby-devel fontconfig -y
RUN dnf install git -y
ADD phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

RUN     adduser $APP_USER 
USER    $APP_USER
RUN     mkdir -p $APP_DIR
COPY    www/Gemfile ${APP_DIR}/Gemfile
COPY    www/Gemfile.lock ${APP_DIR}/Gemfile.lock  
RUN     mkdir -p ${HOME}/scripts
ADD     start.sh ${HOME}/start.sh
WORKDIR $APP_DIR

# Install rbenv, ruby-build
RUN git clone git://github.com/sstephenson/rbenv.git ${HOME}/.rbenv && \
    git clone git://github.com/sstephenson/ruby-build.git ${HOME}/.rbenv/plugins/ruby-build && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ${HOME}/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ${HOME}/.bashrc 

RUN source ${HOME}/.bashrc

RUN bash -l -c 'rbenv install ${RUBY_VERSION}; rbenv global ${RUBY_VERSION}; rbenv rehash'
RUN bash -l -c 'gem install bundle ; bundle check || bundle install'
EXPOSE 3000 1048
CMD ["bash","-l","-c","/home/rails_user/start.sh"]
