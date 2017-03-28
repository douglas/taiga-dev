FROM python:3.6.1-alpine

MAINTAINER Douglas Soares de Andrade <contato@douglasandrade.com>

RUN addgroup -S taiga && adduser -S -g taiga taiga

WORKDIR /taiga_backend
COPY requirements.txt .

RUN apk add --no-cache --virtual .build-deps \
                build-base postgresql-dev libffi-dev libxslt-dev libxml2-dev \
                jpeg-dev freetype-dev zlib-dev libzmq libpng-dev git
RUN pip install -r requirements.txt
RUN pip install django-environ==0.4.0 gevent==1.1.2 django-anymail==0.5

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

# We need gettext to translate strings
RUN apk add --no-cache --virtual gettext
