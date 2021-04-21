RUBY=ruby -r ./lib/main.rb

.EXPORT_ALL_VARIABLES:

.PHONY: all
all: # dependencies defined in rule at bottom of Makefile

.PHONY: clean
clean:
	rm -rf output && mkdir -p output && touch output/.keep

.PHONY: clean-input
clean-input:
	rm -rf input && mkdir -p input && touch input/.keep

.PHONY: docker-build
docker-build:
	docker build -t boston_pd_earnings .

.PHONY: docker-run
docker-run:
	touch env.list && docker run --rm --env-file env.list -v `pwd`:/volume -ti boston_pd_earnings sh

# INPUT

# OUTPUT

all:
