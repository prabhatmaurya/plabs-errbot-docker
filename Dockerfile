FROM python:3.6-alpine


COPY . /app
WORKDIR /app
RUN apk add --no-cache --virtual build_dependencies \
    build-base \
    python3-dev \
    libffi \
    libffi-dev \
    openssl-dev \
    && pip install virtualenv

RUN virtualenv /app/venv
RUN . /app/venv/bin/activate; pip install --no-cache-dir -r requirement.txt

##Cleanup
RUN apk del build_dependencies

COPY config.py /app/config.py
RUN mkdir /srv/data /srv/plugins /srv/errbackends

VOLUME ["errbot:/srv"]
CMD ["sh", "/app/entrypoint.sh"]
