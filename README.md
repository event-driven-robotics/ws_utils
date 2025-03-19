# Getting started with EDPR workstations

As an EDPR user you have access to our workstations whenever you need more computing power.

Here is the list of available workstations and their specs:

- **iiticubws083u**: 48 cores, 504GB RAM, 48GB GPU Nvidia RTX A6000, , 4TB home partition, 4TB root partition, Ubuntu 24.04
- **iiticubws074u**: 48 cores, 377GB RAM, 24GB GPU Nvidia Quadro RTX 6000, , 4TB home partition, 4TB root partition, Ubuntu 24.04

To access them you can run an ssh session using your IIT credentials. 

If you are connected to IIT network or via VPN you can find them using their hostname. (i.e. `` ssh miacono@iiticubws083u ``). Depending on your network configuration you might need to append .iit.local to the hostname (i.e. `` ssh miacono@iiticubws083u.iit.local ``).

To avoid having to type your password you can optionally setup passwordless login. To do that you can refer to [this guide](https://www.strongdm.com/blog/ssh-passwordless-login).

For VSCode users consider taking a look at the [ssh extension](https://code.visualstudio.com/docs/remote/ssh), that allows editing and debugging directly on the remote machine from your laptop.

# Containerization and virtualization

It is **MANDATORY** to use virtual environments or containers to run your code. Every EDPR member has already been enabled access to Docker and virtualenv and virtualenvwrapper is available for everyone to use. 

## Virtualenv and virtualenvwrapper

For **pure Python-based** projects it is likely that you won't need a Docker container and a virtualenv will suffice. For convenience **virtualenvwrapper** provides a set of commands and utilities to keep your virtualenvs organized and it is the **recommended** method for handling virtualenvs. Here is a short list of the most useful commands:

* ``mkvirtualenv <env_name>`` : Creates a new virtual environment called ``<env_name>``. By default they will be created in ``~/.virtualenvs``
* ``workon <env_name>`` : Activates the environment ``<env_name>``. You can tell if an environment is activated because its name appears in brackets at the beginning of the bash command line.
* ``deactivate`` : Deactivates the currently active environment.
* ``rmvirtualenv <env_name``: removes a the virtual environment ``<env_name>``.

## Docker
If your project has a more complex set of dependencies you might have to create a specific container to run it. This is done using Docker. You can find [here](https://github.com/event-driven-robotics/docker-resources) a collection of Docker of EDPR with some instructions. Here are reported some useful commands:

  * `docker run -it --name <CONTAINER_NAME> <IMAGE_NAME>` to run a container in interactive mode.
  * `docker ps -a` to obtain the list of your containers.
  * `docker images` to obtain the list of your images.
  * `docker exec -it <CONTAINER_NAME> bash` to run a bash inside a container.
  * `docker build [OPTIONS] PATH | URL | -` to build Docker images from a Dockerfile. 
  * `docker rmi <IMAGE_NAME>`to remove an image. **NOTE**: all containers and images based on the image to remove must be removed first. 
  * `docker start <CONTAINER_NAME>`to start a container.
  * `docker stop <CONTAINER_NAME>`to stop a container.
  * `docker rm <CONTAINER_NAME>`to remove a container. **NOTE**: container must be stopped first.

# Mounting remote servers

As reported [here](https://github.com/event-driven-robotics/event-driven-robotics.github.io/blob/master/dataservers.md), EDPR has shared storage server that can be accessed to store and/or retrieve data. If you have access to them (some are only open to members of specific projects) you can mount them using the following commands that will mount and link the mounted directory in the current working directory.
* ``mnt_ns008_workspace``
* ``mnt_ns010_projects``
* ``mnt_ns010_users``
* ``mnt_ns010_internal_datasets``
* ``mnt_ns010_scratch``
* ``mnt_stor01_edpr``

The commands rely on the ``mount_smb_storage.sh``, which is installed in the workstations and can also be found in this repository.

# Running long jobs

If you are planning to run long jobs than you should notify the rest of the group in the dedicated Teams channel to check for availability. Consider using ``tmux`` to keep your shell alive once you close the terminal window. Please refer to [this cheatsheet](https://tmuxcheatsheet.com/) for a list of useful tmux commands.

# Data storage management
The home directories reside on the home partition which is 4TB on both workstations. That gives us enough room to be flexible enough with data storage, but **please do not consider the workstation as a permanent storage**, for that we have the dataservers. Also the virtual environments will be stored in your home directory and they can become pretty heavy if not managed carefully.

The root partition  (i.e. where the Docker images are stored), is also pretty large (4TB), but please be considerate especially when using several Docker images as they can get pretty big in size.

# Happy Coding!

We hope this guide helps you get started with EDPR workstations and make the most out of the available resources. Remember to follow the best practices for containerization, virtualization, and data storage management to ensure smooth collaboration and efficient use of resources. If you have any questions or run into issues, feel free to reach out for assistance.
