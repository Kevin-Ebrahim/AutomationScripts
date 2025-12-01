.PHONY: all check download configure build

all: configure

check:
	bash ./check_dependencies.sh

download: check
	bash ./download.sh

build: download
	bash ./build.sh

configure: build
	bash ./configure.sh

