FROM debian:stable
MAINTAINER Matías Aguirre <matiasaguirre@gmail.com>

ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $HOME/.pyenv/shims:$HOME/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update && \
    apt-get install -y make git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
                       libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils && \
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN pyenv install 2.7.13
RUN pyenv install 3.3.6
RUN pyenv install 3.4.5
RUN pyenv install 3.5.2
RUN pyenv install 3.6.0
RUN pyenv install pypy-5.6.0

RUN pyenv local 2.7.13 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local 3.3.6 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local 3.4.5 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local 3.5.2 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local 3.6.0 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset
RUN pyenv local pypy-5.6.0 && \
    pip install --upgrade setuptools pip tox && \
    pyenv local --unset

RUN pyenv local 2.7.13 3.3.6 3.4.5 3.5.2 3.6.0 pypy-5.6.0
