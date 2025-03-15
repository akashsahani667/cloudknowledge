FROM ubuntu:22.04
RUN apt update && apt install -y apache2 wget zip unzip && rm -rf /var/lib/apt/lists/*
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
WORKDIR /var/www/html
RUN wget --retry-connrefused --waitretry=5 --timeout=30 -t 10 -O dicet-tv.zip "https://www.free-css.com/assets/files/free-css-templates/download/page287/dicet-tv.zip" && \
    unzip dicet-tv.zip && \
    cp -rvf html/* . && \
    rm -rf html dicet-tv.zip
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
