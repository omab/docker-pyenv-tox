FROM debian:stable
MAINTAINER Matías Aguirre <matiasaguirre@gmail.com>

ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $HOME/.pyenv/shims:$HOME/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYTHON_VERSIONS 2.7.16 3.3.7 3.4.10 3.5.7 3.6.8 3.7.3 pypy-5.6.0

RUN apt-get update && \
    apt-get install -y make git build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
                       libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils && \
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN for version in $PYTHON_VERSIONS; do \
      pyenv install $version; \
      pyenv local $version; \
      pip install --upgrade setuptools pip tox; \
      pyenv local --unset; \
    done

RUN pyenv local $PYTHON_VERSIONS
