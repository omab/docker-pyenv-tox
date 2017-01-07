IMAGE_NAME := omab/pyenv-tox

build:
	@ docker build -t ${IMAGE_NAME} .

push: build
	@ docker push ${IMAGE_NAME}

shell: build
	@ docker run -it ${IMAGE_NAME} /bin/bash
