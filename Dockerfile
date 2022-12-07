##
# base image (abstract)
##
FROM python:3.10.8-slim-bullseye

# System setup
RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y --no-install-recommends \
    git \
    ssh-client \
    software-properties-common \
    make \
    build-essential \
    ca-certificates \
    libpq-dev \
  && apt-get clean \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

# Env vars
ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

# Update python
RUN python -m pip install --upgrade pip setuptools wheel --no-cache-dir

# Set docker basics
RUN rm -rf /usr/app/dbt/ # for refresh every docker run
WORKDIR /usr/app/dbt/
VOLUME /usr/app
ENTRYPOINT ["dbt"]

## Install Dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

## Bring Necessary files/folders
COPY . .
RUN rm -rf /.dbt
COPY /.dbt/profiles.yml /root/.dbt/profiles.yml
COPY /.dbt/creds.json /root/.dbt/creds.json
RUN dbt deps
RUN dbt docs generate