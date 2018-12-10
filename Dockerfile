FROM centos 
RUN yum update -y
RUN yum install httpd -y 
ADD index.html /var/www/html
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
