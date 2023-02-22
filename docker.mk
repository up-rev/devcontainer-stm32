#@file docker.mk
#@brief makefile for containerized builds of project artifacts 
#@author Jason Berger
#@date 02/20/2023
  

#Project
PROJECT_NAME ?= my_project
BUILD_CONFIG ?= Release
PROJ_DIR ?= .
DEVCONTAINER_IMAGE ?= uprev/stm32

#Docs 
DOC_DIR ?= doc
DOC_IMAGE ?= uprev/sphinx

.PHONY: build doc

#Default is a passthrough to call targets in the default makefile
.DEFAULT:
	docker run --mount src=$(PWD),target=/workspace,type=bind -w /workspace $(DEVCONTAINER_IMAGE) \
	make $@

build: 
	docker run --mount src=$(PWD),target=/workspace,type=bind -w /workspace $(DEVCONTAINER_IMAGE) \
	/opt/stm32cubeide/stm32cubeide -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -import $(PROJ_DIR) -build $(PROJECT_NAME)/$(BUILD_CONFIG)

doc:
	docker run --mount src=$(PWD),target=/workspace,type=bind -w /workspace/$(DOC_DIR) $(DOC_IMAGE) make latexpdf 