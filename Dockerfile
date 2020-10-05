FROM jupyter/datascience-notebook

RUN pip install \
  changefinder  \
  pandas_datareader

USER root

ENV DEBCONF_NOWARNINGS yes
ENV GRANT_SUDO yes

RUN apt-get update && apt-get install -y \
  language-pack-ja-base   \
  language-pack-ja        \
  && apt-get clean        \
  && rm -rf /var/lib/apt/lists/*

RUN sed -i 's/^# *\(ja_JP.*\)$/\1/g' /etc/locale.gen \
  && locale-gen \
  && update-locale LANG=ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8
