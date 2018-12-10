FROM centos 
USER root
RUN yum update -y
RUN yum install httpd -y 
ADD index.html /var/www/html
RUN sed -i "s/Listen.*/Listen 8080/" /etc/httpd/conf/httpd.conf
RUN mkdir -p /run/httpd
RUN chgrp -R 0 /run/httpd /etc/httpd /var/log/httpd /var/www
RUN chmod -R g=u /run/httpd/ /etc/httpd /var/log/httpd /var/www
EXPOSE 8080
CMD ["apachectl", "-D", "FOREGROUND"]
