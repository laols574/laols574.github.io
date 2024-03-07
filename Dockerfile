FROM bitnami/minideb:latest
LABEL MAINTAINER Amir Pourmand

# Update and install dependencies
RUN apt-get update -y && \
    apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev 
zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev git locales imagemagick && 
\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install rbenv and ruby-build
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
    cd ~/.rbenv && src/configure && make -C src && \
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

ENV PATH /root/.rbenv/bin:/root/.rbenv/shims:$PATH

# Install Ruby and Bundler
RUN rbenv install 2.7.2 && \
    rbenv global 2.7.2 && \
    gem install bundler jekyll

# Setup application directory
RUN mkdir /srv/jekyll
WORKDIR /srv/jekyll

# Add Gemfile and install dependencies
ADD Gemfile Gemfile.lock /srv/jekyll/
RUN bundle install

