Devcontainer-stm32
==================

This repo contains the dockerfile for the uprev/stm32 image as well as the vscode devcontainer configuration


Using devcontainer
------------------
To add the devcontainer configuration to a project, add this repos as a submodule with the path '.devcontainer':

.. code:: bash 

    git submodule add git@github.com:up-rev/devcontainer-stm32.git .devcontainer

Then in vscode you can use the green 'Remote' button in the bottom corner and select 'Reopen in Container'


Containerized Build 
-------------------
Copy docker.mk to the root of the poject. Set the PROJECT_NAME and BUILD_CONFIG variables. Then run the build 

.. code:: bash 

    make -f docker.mk build 

This will pull the docker, mount the project, run a build, and exit. 

