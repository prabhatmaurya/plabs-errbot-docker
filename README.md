# plabs-errbot-docker

### Introduction
Dockerfile to build an [Errbot](http://errbot.io).
This example is only for errbot with slack backend, Please replace your own config.py for other supported backends.

Configuration
~~~~~~~~~~~~~

    $ mkdir workdir
    $ cd workdir
    $ git clone https://github.com/prabhatmaurya/plabs-errbot-docker.git
    $ cd plabs-errbot-docker
    $ cp config.py.example config.py
    $ vi config.py
    $ docker-compose up --build
    
~~~~~~~~~~~~~
