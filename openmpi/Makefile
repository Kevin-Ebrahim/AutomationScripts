.PHONY: all check download configure build clean

all: build

check:
	bash ./check_dependencies.sh

download: check
	bash ./download.sh

configure: download
	bash ./configure.sh

build: configure
	bash ./build.sh

clean:
	bash ./clean.sh

