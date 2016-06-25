#FROM index.alauda.cn/library/alpine:3.3
FROM index.alauda.cn/boyfriend/brokeback

RUN apk update && apk add -u python py-pip nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN pip install supervisor supervisor-stdout

ADD supervisord.conf /etc/supervisord.conf
ADD nginx.conf /etc/nginx/nginx.conf

RUN mkdir /run/nginx/
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
