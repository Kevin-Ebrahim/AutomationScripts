.PHONY all check download configure build

all: build

check:
	bash ./check_dependencies.sh

download: check
	bash ./download.sh

build: download
	bash ./build.sh
