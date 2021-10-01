FROM mysql:8

RUN apt-get update && \
    apt-get install -y locales wget unzip && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8

RUN wget 'http://downloads.mysql.com/docs/sakila-db.zip' -P /tmp/. && \
    unzip /tmp/sakila-db.zip -d /tmp/. && \
    cp /tmp/sakila-db/sakila-schema.sql /docker-entrypoint-initdb.d/.

ENV TZ=Asia/Tokyo

ENV LC_ALL ja_JP.UTF-8
