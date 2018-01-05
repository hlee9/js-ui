.PHONY: ng react vue

HOST ?= 0.0.0.0
PORT ?= 8080

# Set project variables
PROJECT := js-ui
GITHUB_REPO := js-ui
GITHUB_CORP := dockerian

# Set docker variables
DOCKER_USER := dockerian
DOCKER_IMAG := $(PROJECT)
DOCKER_TAGS := $(DOCKER_USER)/$(DOCKER_IMAG)
DOCKER_FILE ?= Dockerfile
DOCKER_DENV := $(wildcard /.dockerenv)
DOCKER_PATH := $(shell which docker)
DOCKER_PORT ?= $(PORT)

# Don't need to start docker in 2 situations:
ifneq ("$(DOCKER_DENV)","")  # assume inside docker container
	DONT_RUN_DOCKER := true
endif
ifeq ("$(DOCKER_PATH)","")  # docker command is NOT installed
	DONT_RUN_DOCKER := true
endif

# set to one of JavaScript framework folder options: ng, react, vue
JSF ?= vue
# prerequisite tool set
SYSTOOLS := awk egrep find grep jq node npm rm sort tee xargs zip
# set to docker/host hybrid script
MAKE_RUN := tools/run.sh
# set debug mode
DEBUG ?= 1


check-tools:
	@echo ""
ifndef DONT_RUN_DOCKER
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	$(MAKE_RUN) $@
else
	@echo "--- Checking for presence of required tools: $(SYSTOOLS)"
	$(foreach tool,$(SYSTOOLS),\
	$(if $(shell which $(tool)),$(echo "boo"),\
	$(error "ERROR: Cannot find '$(tool)' in system $$PATH")))
endif
	@echo ""
	@echo "- DONE: $@"


# clean targets
clean-cache clean:
	@echo ""
	@echo "-----------------------------------------------------------------------"
	@echo "Cleaning build ..."
	find . -name '.DS_Store' -type f -delete
	find . -name \*.bak -type f -delete
	find . -name \*.log -type f -delete
	find . -name \*.out -type f -delete
	@echo ""
	@echo "Cleaning up cache and coverage data ..."
	rm -rf .cache
	rm -rf .vscode
	@echo ""
	@echo "- DONE: $@"

clean-all: clean-cache
	@echo ""
ifeq ("$(DOCKER_DENV)","")
	# not in a docker container
	@echo "Cleaning up docker container and image ..."
	docker rm -f \
		$(shell docker ps -a|grep $(DOCKER_IMAG)|awk '{print $1}') \
		2>/dev/null || true
	docker rmi -f \
		$(shell docker images -a|grep $(DOCKER_TAGS) 2>&1|awk '{print $1}') \
		2>/dev/null || true
endif
	rm -rf docker_build.tee
	@echo ""
	@echo "Cleaning up node_modules ..."
	find . -name node_modules -type d | xargs rm -rf
	npm cache clean --force || true
	@echo ""
	@echo "- DONE: $@"


# docker targets
docker cmd: docker_build.tee
	@echo ""
ifeq ("$(DOCKER_DENV)","")
	# not in a docker container yet
	@echo `date +%Y-%m-%d:%H:%M:%S` "Start bash in container '$(DOCKER_IMAG)'"
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	$(MAKE_RUN) cmd
else
	@echo "env in the container:"
	@echo "-----------------------------------------------------------------------"
	@env | sort
	@echo "-----------------------------------------------------------------------"
endif
	@echo ""
	@echo "- DONE: $@"

docker_build.tee: $(DOCKER_FILE)
	@echo ""
ifeq ("$(DOCKER_DENV)","")
	# make in a docker host environment
	@echo `date +%Y-%m-%d:%H:%M:%S` "Building '$(DOCKER_TAGS)'"
	@echo "-----------------------------------------------------------------------"
	docker build -f "$(DOCKER_FILE)" -t $(DOCKER_TAGS) . | tee docker_build.tee
	@echo "-----------------------------------------------------------------------"
	@echo ""
	docker images --all | grep -e 'REPOSITORY' -e '$(DOCKER_TAGS)'
	@echo "......................................................................."
	@echo "- DONE: {docker build}"
	@echo ""
endif


# default targets
build:
	@echo ""
ifndef DONT_RUN_DOCKER
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	DOCKER_PORT=$(DOCKER_PORT) \
	$(MAKE_RUN) $@
else
	@echo "Run build ..."
	cd "$(JSF)" && npm run build
endif
	@echo ""
	@echo "- DONE: $@"

start run:
	@echo ""
ifndef DONT_RUN_DOCKER
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	DOCKER_PORT=$(DOCKER_PORT) \
	$(MAKE_RUN) $@
else
	@echo "Run start/serve ..."
	cd "$(JSF)" && npm start
endif
	@echo ""
	@echo "- DONE: $@"

unit test:
	@echo ""
ifndef DONT_RUN_DOCKER
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	DOCKER_PORT=$(DOCKER_PORT) \
	$(MAKE_RUN) $@
else
	@echo "Run test ..."
	cd "$(JSF)" && npm run $@
endif
	@echo ""
	@echo "- DONE: $@"


# run/start targets for js frameworks
ng ng-start start-ng:
	@echo ""
ifndef DONT_RUN_DOCKER
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	DOCKER_PORT=$(DOCKER_PORT) \
	$(MAKE_RUN) $@
else
	@echo "Run test ..."
	cd ng && npm start
endif
	@echo ""
	@echo "- DONE: $@"

react react-start start-react:
	@echo ""
ifndef DONT_RUN_DOCKER
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	DOCKER_PORT=$(DOCKER_PORT) \
	$(MAKE_RUN) $@
else
	@echo "Run test ..."
	cd react && npm start
endif
	@echo ""
	@echo "- DONE: $@"

vue vue-start start-vue:
	@echo ""
ifndef DONT_RUN_DOCKER
	PROJECT_DIR="$(PWD)" \
	JSF=$(JSF) HOST=$(HOST) PORT=$(PORT) \
	GITHUB_USER=$(GITHUB_CORP) GITHUB_REPO=$(GITHUB_REPO) \
	DOCKER_USER=$(DOCKER_USER) DOCKER_NAME=$(DOCKER_IMAG) DOCKER_FILE="$(DOCKER_FILE)" \
	DOCKER_PORT=$(DOCKER_PORT) \
	$(MAKE_RUN) $@
else
	@echo "Run test ..."
	cd vue && npm start
endif
	@echo ""
	@echo "- DONE: $@"
