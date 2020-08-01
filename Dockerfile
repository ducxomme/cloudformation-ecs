# setting base image
FROM centos:centos7

# install Apache http server
RUN ["yum",  "-y", "install", "httpd"]

RUN echo "<html>Hello</html>" > /var/www/html/index.html

# start httpd
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
