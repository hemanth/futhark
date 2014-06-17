#!/bin/bash 

apt-get install ruby rubygems

gem1.8 install fpm --no-ri --no-rdoc

apt-get install build-essential openssl libreadline6 libreadline6-dev \ 
zlib1g zlib1g-dev libssl-dev ncurses-dev libyaml-dev

wget http://ftp.ruby-lang.org/pub/ruby/ruby-2.0-stable.tar.gz

tar -zxvf ruby-2.0-stable.tar.gz && rm ruby-2.0-stable.tar.gz

cd ruby*

rm -rf /tmp/ruby20

./configure --prefix=/usr && make && make install DESTDIR=/tmp/ruby20

  
/var/lib/gems/1.8/bin/fpm -s dir -t deb -n ruby20 -v 2.0 --description \
"Ruby 2.0 stable package" -C /tmp/ruby20 \

  -p ruby2.0-VERSION_ARCH.deb -d "libstdc++6 (>= 4.4.3)" \

  -d "libc6 (>= 2.6)" -d "libffi5 (>= 3.0.4)" -d "libgdbm3 (>= 1.8.3)" \

  -d "libncurses5 (>= 5.7)" -d "libreadline6 (>= 6.1)" \

  -d "libssl0.9.8 (>= 0.9.8)" -d "zlib1g (>= 1:1.2.2)" \

  -d "libyaml-0-2 (>= 0.1.3)" \

  usr/bin usr/lib usr/share/man usr/include

  
# Deb is ready!

apt-get remove ruby rubygems

apt-get install libffi5 libyaml-0-2

dpkg -i ruby2*.deb

ruby -ropenssl -rzlib -rreadline -ryaml -e "puts :Oh yeah!"

