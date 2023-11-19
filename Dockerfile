FROM python:3.6-alpine


COPY . /app
WORKDIR /app
RUN apk add --no-cache --virtual build_dependencies \
    build-base \
    python3-dev \
    libffi \
    libffi-dev \
    openssl-dev \
    git \
    && pip install virtualenv

RUN mkdir /srv/data /srv/plugins /srv/errbackends

RUN virtualenv /app/venv
RUN . /app/venv/bin/activate && pip install --no-cache-dir -r requirement.txt && git clone https://github.com/errbotio/err-backend-slackv3 /srv/errbackends/err-backend-slackv3 && cd /srv/errbackends/err-backend-slackv3 && pip install .

##Cleanup
RUN apk del build_dependencies

COPY config.py /app/config.py


VOLUME ["errbot:/srv"]
CMD ["sh", "/app/entrypoint.sh"]
