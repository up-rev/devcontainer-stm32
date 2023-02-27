Devcontainer-stm32
==================

This repo contains the dockerfile for the `uprev/stm32 image <https://hub.docker.com/r/uprev/stm32>`_ as well as the vscode devcontainer configuration


Adding to a Project  
-------------------

Devcontainer 
~~~~~~~~~~~~

To add the devcontainer configuration to a project, add this repos as a submodule with the path '.devcontainer':

.. code:: bash 

    git submodule add git@github.com:up-rev/devcontainer-stm32.git .devcontainer

Then in vscode you can use the green 'Remote' button in the bottom corner and select 'Reopen in Container'. This will mount the project inside of a docker container wit all of the build dependencies. 


Containerized buids
~~~~~~~~~~~~~~~~~~~

This repo contains a makefile script for doing containerized builds of a project. This is meant to provide customers with a repeatable build environment to reproduce project arfitifacts. 

1.  Copy docker.mk to the root of the poject. 
2.  Set the PROJECT_NAME and BUILD_CONFIG variables
3.  Copy applicable parts of 'Build Instruction' section to projects README 

Use Existing Makefile 
~~~~~~~~~~~~~~~~~~~~~ 

If the project already has a makefile, you can use 'docker.mk' to build targets inside of the devcontainer. Any targets not explicitly defined in `docker.mk` will act as a pass-trough and run that target with the default Makefile inside of the devcontainer. 

Example: 

.. code:: bash 

    make -f docker.mk build 

would be the same as opening the project inside of the devcontainer and running : 

.. code:: bash 

    make build 


Build Instruction
-----------------

This project contains a script for containerized builds. This allows the project arfitifacts to be built from virtually any system with a single command. The only requirements for the build are `Docker <https://docs.docker.com/engine/install/>`_ and `Make <https://www.gnu.org/software/make/>`_. 

.. note:: If using Windows you can install 'Ubuntu' from the Microsoft store and use a Ubuntu terminal for Make. 

Firmware Build 
~~~~~~~~~~~~~~

To build the firmware image: 

.. code:: bash 

    make -f docker.mk docker-build 

This will pull the docker, mount the project, run a build, and exit. The binaries will be under `Release`

Documentation Build 
~~~~~~~~~~~~~~~~~~~

To build the Documentation for this project : 

.. code:: bash 

    make -f docker.mk docker-doc

This will use the `uprev/sphinx` image to build the documentation which will be available as a pdf in the `doc/_build/latex` folder

