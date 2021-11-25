###
#
#  EXample Makefile
#
#######

PYTHON=.env/bin/python # path to python executable
PIP=.env/bin/pip # path to pip
SOURCE_ENV=. .env/bin/activate # shell within the environment
SRC_NAME=src
IMAGE=test_build
TAG=latest


info: 
	@cat README.md

installEnv:
	python3 -m venv .env

installDependencies: installEnv
	@$(SOURCE_ENV) 
	$(PIP) install .

debug:


docker:
	docker build . -t $(IMAGE):$(TAG)

test-service:
	docker network create skynet
	docker run -d --name t-service \
		--network skynet \
		--env LOGLEVEL=VERBOSE \
		-p 127.0.0.1:38080:8080 \
		$(IMAGE):$(TAG)



