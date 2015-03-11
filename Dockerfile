### SSH without root login 

FROM ubuntu:14.04
MAINTAINER Veerendra <veeru538@gmail.com>

## Install Openssh-server 
RUN apt-get update && apt-get install -y openssh-server

# Create sshd dorectory
RUN mkdir /var/run/sshd

# set 'Secreet' as the password for root
RUN echo 'root:Secreet' | chpasswd

# Create user  'veeru'  with homedirectory and add shell bash
RUN useradd -m -d /home/veeru -p veeru veeru  && adduser veeru sudo && chsh -s /bin/bash veeru
# set 'password' as the password for user veeru
RUN echo 'veeru:password' | chpasswd

# Donot allow root login 
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin no/' /etc/ssh/sshd_config
RUN sed -i 's/usePAM yes/usePAM no/' /etc/ssh/sshd_config

# Sets the environment varible NOTVISIBLE
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Exposes port 22 within the container
EXPOSE 22

# automatically ssh into the container once it is built
CMD ["/usr/sbin/sshd", "-D"]
