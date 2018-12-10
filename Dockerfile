FROM centos 
USER root
RUN yum update -y
RUN yum install httpd -y 
ADD index.html /var/www/html
RUN sed -i "s/Listen.*/Listen 8080/" /etc/httpd/conf/httpd.conf
RUN mkdir -p /run/httpd
RUN mkdir -p /etc/httpd/logs
RUN chgrp -R 0 /run/httpd /etc/httpd
RUN chmod -R g=u /run/httpd/ /etc/httpd
EXPOSE 8080
CMD ["apachectl", "-D", "FOREGROUND"]
