# Specify the Base Image
FROM centos:7

# Add a tag
LABEL maintainer="our ownsome teacher Claudio"

# Update our packages
RUN yum -y update && yum clean all

# Install Apache ---> create /var/www/html
RUN yum install -y httpd

# Copy the app inside the container
COPY index.html /var/www/html/

# Port on which the container should listen on
EXPOSE 80

# Run httpd by doing systemctl start httpd 
# hey when container starts please start httpd
ENTRYPOINT [ "/usr/sbin/httpd" ]

# We dont want the container to exit 
# run the container in the background
CMD [ "-D", "FOREGROUND" ]
