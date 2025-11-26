.PHONY: all check download configure install

all: build

check:
	bash ./check_dependencies.sh

download: check
	bash ./download.sh

configure: download
	bash ./configure.sh

install: configure
	bash ./install.sh
