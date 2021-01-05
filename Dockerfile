FROM nginx:latest

# update container
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y git

#copy all files
COPY src/nginx-files/ /etc/nginx/
RUN mkdir -pv /var/www/lug-erkelenz.de/
COPY src/hugo-files/ /hugo-files/
#COPY post/ /hugo-files/lug-erkelenz.de/content/post/

#Add Hugo
ARG VERSION=0.80.0
ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -zxvf hugo.tar.gz
RUN /hugo version

RUN /hugo -v --config="/hugo-files/lug-erkelenz.de/config.yml" -s /hugo-files/lug-erkelenz.de/ -d /var/www/lug-erkelenz.de/

EXPOSE 80

CMD ["/usr/sbin/nginx"]
