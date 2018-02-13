# Qengine Docker-Compose Files

These files are for helping you get a Qengine network started quickly. You'll want to have all your Docker images ready or build them with `build.sh`. Then you can start the network using the `compose.sh` script, or configure your own set up manually with your own docker-compose.yml file.

### build.sh

`build.sh [hostname]`

This will prompt you with which Qengine compatible microservices you want to build locally and under what hostname ([hostname]/image). If you plan on using remote images, you don't need to run this.

### compose.sh

`compose.sh [hostname] [domain]`

This will attempt to quick start a Qengine network for you. It will use default Qengine files and configuration, as well as a default docker-compose.yml file. You can change these though, and compose.sh will ask you if you would like to use existing files or create new ones from the defaults.

"hostname" refers to the image hostnames ([hostname]/image) & "domain" refers the address you want to access Qengine at (this could be a domain name or an ip address).

