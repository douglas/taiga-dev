FROM python:3.6.1-alpine

MAINTAINER Douglas Soares de Andrade <contato@douglasandrade.com>

RUN addgroup -S taiga && adduser -S -g taiga taiga

WORKDIR /taiga_backend

RUN apk add --no-cache --virtual .build-deps \
                build-base
RUN pip install django celery gevent redis

# Cleanup
RUN find /usr/local \
        \( -type d -a -name test -o -name tests \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' + \
    && runDeps="$( \
        scanelf --needed --nobanner --recursive /usr/local \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | sort -u \
            | xargs -r apk info --installed \
            | sort -u \
    )" \
    && apk add --virtual .rundeps $runDeps \
    && apk del .build-deps
