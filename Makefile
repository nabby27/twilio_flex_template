TWILIO_CONTAINER_NAME=twilio

include .env
export $(shell sed 's/=.*//' .env)

plugin/install:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) /bin/bash -c "cd $(PLUGIN_NAME) && npm install $(deps)"

plugin/postinstall:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) /bin/bash -c "cd $(PLUGIN_NAME) && npm run postinstall"

twilio/version:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) twilio version

twilio/flex/plugin/help:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) twilio flex:plugins --help

twilio/flex/plugin/create:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) twilio flex:plugins:create -s $(PLUGIN_NAME)

twilio/flex/plugin/build:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) /bin/bash -c "cd $(PLUGIN_NAME) && twilio flex:plugins:build"

twilio/flex/plugin/start:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) /bin/bash -c "cd $(PLUGIN_NAME) && twilio flex:plugins:start"

twilio/flex/plugin/deploy:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) /bin/bash -c "cd $(PLUGIN_NAME) && twilio flex:plugins:deploy"

twilio/flex/plugin/test:
	@docker compose run --rm $(TWILIO_CONTAINER_NAME) /bin/bash -c "cd $(PLUGIN_NAME) && twilio flex:plugins:test"