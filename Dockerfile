FROM centos 
USER root
RUN yum update -y
RUN yum install httpd -y 
ADD index.html /var/www/html
RUN sed -i "s/Listen.*/Listen 8080/" /etc/httpd/conf/httpd.conf
RUN mkdir -p /run/httpd
RUN chgrp -R root /run/httpd /etc/httpd
RUN chmod -R g+rw /run/httpd/ /etc/httpd
EXPOSE 8080
CMD ["apachectl", "-D", "FOREGROUND"]
