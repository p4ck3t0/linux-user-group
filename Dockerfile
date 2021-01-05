FROM nginx:latest

#copy all files
COPY ../src/nginx-files/ /etc/nginx/
RUN mkdir -pv /var/www/lug-erkelenz.de/
COPY ../src/hugo-files/ /hugo-files/
#COPY post/ /hugo-files/lug-erkelenz.de/content/post/

#Add Hugo
ARG VERSION=0.80.0
ADD https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -zxvf hugo.tar.gz
RUN /hugo version

RUN /hugo --config="/hugo-files/lug-erkelenz.de/config.toml" -s /hugo-files/lug-erkelenz.de/ -d /var/www/lug-erkelenz.de/

EXPOSE 80

CMD ["/usr/sbin/nginx"]
