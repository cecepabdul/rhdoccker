VERSION = $(shell head -n 1 .version)

set:
	echo $(VERSION) > .version

build:
	docker build --build-arg VERSION=${VERSION} -t rhminer_${VERSION} ./

start:
	docker run -p 127.0.0.1:7111:7111 --network="host" -v $$PWD/miner.sh:/home/rhminer/miner.sh -i -t rhminer_${VERSION}


stop:
	docker stop $$(docker ps -a -q --filter ancestor=rhminer_${VERSION} --format="{{.ID}}")

restart: stop
	make start
