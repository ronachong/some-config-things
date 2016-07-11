from ubuntu:14.04
MAINTAINER Rona Chong "ronachong@gmail.com"

# This image automatically builds and serves as a basic terminal
# environment for a developer to develop in.

# After pulling, run with `docker run -i -t <imagename>`

# Set-up includes:
# update of apt's package cache
# installation of man pages
# installation of curl
# installation of tcl (specifically tcl 8.6.5)
# installation of expect
# configuration of ssh to access github
# configuration of ssh to access remote servers
# installation and configuration of emacs (w/ Fill Column Indicator)
# installation and configuration of git
# installation of Python (specifically Python 3.5.2)
# installation of Ruby Version Manager (specifically Ruby Version Manager 1.27.0)
# installation of Ruby (specifically Ruby 2.3.1)
# installation of Bundler (Ruby gem)
# installation of Capistrano and Capistrano-ext (Ruby gems)
# initialization of the folder holberton_repos

# (Further things to add to set-up, if possible)
# gem install github-pages (for Jekyll)


WORKDIR /root
RUN apt-get -y update && apt-get install -y \
    man-db \
    curl \
    emacs24 \
    git \
&& rm -rf /var/lib/apt/lists
    
RUN git config --global user.name "Rona Chong"
RUN git config --global user.email "ronachong@gmail.com"
RUN git config --global core.editor "emacs"
RUN curl -s https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz > Python-3.5.2.tgz
RUN gunzip -d Python-3.5.2.tgz
RUN tar xvf Python-3.5.2.tar
RUN rm -rf Python-3.5.2
RUN rm -rf Python-3.5.2.tar
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
# RUN source /home/admin/.rvm/scripts/rvm
# RUN source /root/.rvm/scripts/rvm
# RUN source /root/.rvm/scripts/rvm.sh
# RUN source /etc/profile.d/rvm.sh
RUN source /etc/profile.d/rvm.sh
RUN rvm install 2.3.1
RUN gem install bundler
RUN gem install capistrano
RUN gem install capistrano-ext

RUN curl -s http://liquidtelecom.dl.sourceforge.net/project/tcl/Tcl/8.6.5/tcl8.6.5-src.tar.gz > tcl8.6.5-src.tar.gz
RUN gunzip -d tcl8.6.5-src.tar.gz
RUN tar -xvf tcl8.6.5-src.tar
WORKDIR /root/tcl8.6.5/unix
RUN ./configure
RUN make
# RUN make test | not sure if this test is necessary
RUN make install

WORKDIR /root
RUN curl -s http://pilotfiber.dl.sourceforge.net/project/expect/Expect/5.45/expect5.45.tar.gz > expect5.45.tar.gz
RUN gunzip -d expect5.45.tar.gz
RUN tar -xvf expect5.45.tar
WORKDIR /root/expect5.45
RUN ./configure
RUN make
RUN make install
RUN ln -svf expect5.45/libexpect5.45.so /usr/lib

WORKDIR /root
# before removing files, might want to use make clean (not implemented here yet)
RUN rm -rf expect5.45
RUN rm expect5.45.tar
RUN rm -rf tcl8.6.5
RUN rm tcl8.6.5-src.tar

RUN touch /root/script
RUN echo "#!/usr/bin/expect -f
spawn git clone https://github.com/ronachong/configuration.git
expect "Username for 'https://github.com':"
send "ronachong\n";
expect "Password for 'https://ronachong@github.com':"
send "awe7qsd6\n";
interact" > /root/script
RUN expect /root/script

RUN mkdir /root/.ssh
RUN touch /root/.ssh/id_rsa
RUN echo "-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEApsZbZW6tzyHtlqkCwUaZGeuP1b/yexu5uRAcna9NfEoJ33G2
m7r80UvqueEpW8OmCj9Vd3HY/pqLGYf/aMt0A7LC9VY72rALupiMM29EB7eOvGXB
nifCIA/eM406oWyTSwWZNgj11UswvC9OPCb9xojGQVG179d7p/pbLPvD1IQpw+by
JALAM6Pll3IRchSpU4FjKqR2JIxxNI2HKtd62X3TJAhvgUKVba1lJKLIGb4Z4gJt
km/wQRNV+fgGN4ImRa5BmZ1bbCfA82hjthIsUmmKA4V5HzqWaiaA+idQenWJEXMO
WSvN09Fbwh/svZqJo4iHq+kyGDiqza/KKdYxFwIDAQABAoIBABgdLjHoYvFEMppK
Lb/MeW6qBM4fRuxOAfikP779DfMesXbBdmnmC5AnrfTafaRrEaMBrVXr/Dg0GFDE
vUVlxYyTWGUo5takBc4hKIR3XhrPi6/p9qjrjsIcCUDi9stIa7O5R4Hsob8JdC6B
mIpSCPef5yqiqe/X9GVBadWDQbmEdsU/kBJYnos/82iEvwu2EG4liD/F5m1+5YTA
uGHpstpv915SV/bzmUf7kaVDV9JBelENuC/i/yE4+HEAS7Fja7PKCrp8W5WSNb5w
a1rHcbgoiZ2BdbKY6NXslo6SBli1K//7ue3N1Hi9cIxTsMVszK42+iRMgSJI0u1o
RRUOaGECgYEA2CDU4ZBKbev2ANqMTq5jF+dNacqVwJmzTprPBGaJF0ob73Pq9xtO
PbpO2xXlUkNjM7fowNdBdvi8m6UJbhAtQ2MoLQkm6YocdqUB80O9pgJ2zOagbhXm
YbYFEgZ1XiwDOJhlMgSfNy+b1o1/h99KggmEBb5DD3Ie6DMEjSN8PC0CgYEAxYqx
h4CTBAvac5VzVZvlitM92eTO5JDdKPxYQMcPQn1CgKQS7S3GFebkYnv265UM3M19
YgRA+qCfhFr2ricjsDmTMii/VMMW+sE2TZBnbBBYs6f+/+eLAkUcqmi2BzJdAcWt
hnzBQu6BIReNIRVGI53PHXMkh5ylc8Qvw4bZ+NMCgYB/9iBUVGvc3QHPy5Wa2CEP
fAEXi7xSRi4lcf7zqgms4lHb2hPZri8K2Q3rJPGbXQ6VBmQmGMxHtkllFbeZlLZX
2ZNl5q9FQmJL1LJs50SXz4mrEzkVNJ4sZ+pkm7JNyV022vO/Q4FI2UU5KJnDRm8E
wsGJ7PYjZPvrmpktPz9FGQKBgFcq71Giq7zyWg/816rkIvMSac2XiLAVOHIYf/z9
mb82NL09KVjdhPYvL4JBv2CPIeDhED3LML0nWZx24zlP7hCaJ1jP4DXP7Hjz/zlU
yj5GLE4CiKR1kMKMqqyLjh842w+oIf0hWcpmIjbvBIifsZaP0U/mei0ZM20VGhqG
i/KfAoGAOk7Z7InwgHS0V7j1l/5Q2dwPWW+AYMBz5kHfls710i2H0SOHVE62jRij
YmX3sdTCjmp9o2Pc7Ji0/KfF/S+fa1LC4pgQ994mb2sZOfcoLGibkJFFE3t9+1bo
Qo0X+C2TUVe070iTF6faXY6tBUU5KXjFje5NnSzpMo1aru/z40Q=
-----END RSA PRIVATE KEY-----" > /root/.ssh/id_rsa
RUN echo "-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-128-CBC,9159FB3E5AA2E21AF22CEAB387AE3249

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
-----END RSA PRIVATE KEY-----" > /root/.ssh/server_id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/server_id_rsa
RUN touch /root/.ssh/known_hosts
RUN echo "github.com,192.30.252.129 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
158.69.79.94 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOiExX2whL3gEb8pdkFFUX1MQ4cNTU0MIQ63aNs+r5z9uYVqlDlFihtWRjq5rUU7Rwr3z2476skMBCilqLUOoy4=
54.208.83.36 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBIZIET5DVMUl4vQkYNfaWxaNFHF5km1Za7rgS6KPh4gVwTaJtBCHCt4d/+waWfXfmlw0dHvccv7cukKrwLRvr8w=
54.209.26.159 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBMUqY30F8GQqZY2ijZSKaGHBjbTP5+TYA8Zu5h3XR+Roc4XSv6YdALTNaVf3x6iRM7zlRgEBAuJ0cDA4joARqcY=" > /root/.ssh/known_hosts
RUN touch /root/.ssh/config
RUN echo "Host 158.69.79.94
    User admin
    IdentityFile /root/.ssh/server_id_rsa
Host 54.208.83.36
     User ubuntu
     IdentityFile /root/.ssh/server_id_rsa" > /root/.ssh/config


RUN eval $("ssh-agent")
RUN touch /root/gh_ssh_script
RUN echo "#!/usr/bin/expect -f
spawn ssh-add /root/.ssh/id_rsa
expect "Enter passphrase for /root/.ssh/id_rsa:"
send "awe7qsd6\n";" > gh_ssh_script
RUN echo "#!/usr/bin/expect -f
spawn ssh-add /root/.ssh/server_id_rsa
expect "Enter passphrase for /root/.ssh/server_id_rsa:"
send "awe7qsd6\n";" > server_ssh_script
RUN expect gh_ssh_script
RUN expect server_ssh_script


RUN git clone git@github.com:ronachong/configure-IDE.git
RUN cp /root/configure-IDE/emacs/init.el .emacs.d/init.el


RUN mkdir /root/holberton_repos