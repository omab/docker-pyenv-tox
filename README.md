# Docker pyenv + tox

Setup a [tox](https://tox.readthedocs.io/) environment
using [pyenv](https://github.com/yyuu/pyenv) to install multiple
Python versions.

# Usage

* Create a `Dockerfile`

```dockerfile
FROM omab/pyenv-tox
```

* Build and run the Docker image:

```console
$ docker build -t my-pyenv-tox .
$ docker run -it --rm --name my-pyenv-tox-app -v "$PWD:/code" my-pyenv-tox tox
```

# Credits

This Dockerfile was built based from ideas
from [n42org/docker-tox](https://github.com/n42org/docker-tox)
and [mcandre/docker-pyenv](https://github.com/mcandre/docker-pyenv).
