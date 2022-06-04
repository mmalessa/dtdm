APP_NAME = dtdm
BASE_IMAGE = jlesage/baseimage-gui:debian-10

IMAGE = $(APP_NAME)

DOCKERFILE = ./Dockerfile

.DEFAULT_GOAL = help

#-----------------------------------------------------------------------------------------------------------------------
ARG := $(word 2, $(MAKECMDGOALS))
%:
	@:
#-----------------------------------------------------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

build: ## Build image
	@docker build 										\
	    -t $(IMAGE)										\
		--build-arg BASE_IMAGE=$(BASE_IMAGE)			\
		-f $(DOCKERFILE)								\
		.
up: ## Start application container
	@COMPOSE_PROJECT_NAME=$(APP_NAME) \
	IMAGE=$(IMAGE) \
	APP_NAME=$(APP_NAME) \
	docker-compose up -d

down: ## Remove application dev container
	@COMPOSE_PROJECT_NAME=$(APP_NAME) \
	IMAGE=$(IMAGE) \
	APP_NAME=$(APP_NAME) \
	docker-compose down

console: ## Enter application container
	@docker exec -it $(APP_NAME)-app bash

logs: ## Display logs
	@docker logs -f $(APP_NAME)-app