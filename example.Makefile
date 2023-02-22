PROJECT ?= myproject
CONFIG ?= Release


#Docker image to use 
DOCKER_IMAGE ?= uprev/stm32

#This points to the installation of stm32cubeide, leave as default if using dockerbuild
STM32CUBEIDE ?= /opt/stm32cubeide/stm32cubeide


.PHONY: dockerbuild build

build:
    $(STM32CUBEIDE) -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -import . -build $(PROJECT)/$(CONFIG)

dockerbuild: 
    docker run --mount src=$(PWD),target=/workspace,type=bind -w /workspace $(DOCKER_IMAGE) make build




