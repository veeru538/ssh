## Supervisor
FROM ssh
MAINTAINER Veerendra <veeru538@gmail.com>

# Install Superviser
RUN sudo apt-get update && sudo apt-get install -y supervisor
# Directory for storing logs
RUN mkdir -p /var/log/supervisor

# Add the supervisor configuration file from the Current working Directory into a specified directory in the container
ADD ./supervisord.conf  /etc/supervisor/supervisord.conf

# Openting SSH port
EXPOSE 22

# Run the superviser command 
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
