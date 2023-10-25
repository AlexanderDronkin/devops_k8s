SHELL = /usr/bin/env sh
CLEAR = printf "\033c"

# assembling for:
OS=linux
ARCH=amd64
CGO=0

REGISTRY = ${CI_REGISTRY_BASE}
IMAGE = "$(REGISTRY)/$(MAKECMDGOALS):latest"

# местоположение
.SILENT: locations
locations: asm all
	echo "\033[1;32m[i]\033[0m [Done]"

# тестовые площадки
.SILENT: zookeeper
zookeeper: all
	echo "\033[1;32m[i]\033[0m [Done]"

# база
.SILENT: freshdb
freshdb: all
	echo "\033[1;32m[i]\033[0m [Done]"

# апи сервер
.SILENT: metalapi
metalapi: all
	echo "\033[1;32m[i]\033[0m [Done]"

# сборка облачного приложения из src
.SILENT: all
all: build push
	$(CLEAR)
	echo "\033[1;32m[i]\033[0m Building src/$(MAKECMDGOALS) [Done]"
	echo "\033[1;32m[i]\033[0m Pushing image [Done]"

.SILENT: asm
asm:
	$(CLEAR)
	echo "\033[1;34m[i]\033[0m Assembling src/$(MAKECMDGOALS)"
	CGO_ENABLED=$(CGO) GOOS=$(OS) GOARCH=$(ARCH) go build -C "./src/$(MAKECMDGOALS)" -o "$(MAKECMDGOALS)"

.SILENT: build
build:
	$(CLEAR)
	echo "\033[1;34m[i]\033[0m Building src/$(MAKECMDGOALS)"
    #_PRIVATE_#

.SILENT: push
push:
	$(CLEAR)
	echo "\033[1;32m[i]\033[0m Building src/$(MAKECMDGOALS) [Done]"
	echo "\033[1;34m[i]\033[0m Pushing image"
	docker push "$(IMAGE)" >/dev/null 2>/dev/null