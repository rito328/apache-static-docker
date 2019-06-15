FROM centos:latest

RUN yum -y update && yum -y install httpd

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/var/www/init/setting.sh"]