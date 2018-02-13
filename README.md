# Qengine-MAESC
A repo to build a Qengine Docker image and run it in a microservice architecture.

#### Build only the Qengine image
You can build the image by itself by running the build.sh script.

#### Compose the Qengine & block images
You can use docker-compose to build, link, & run the Qengine image along with other block images. Use the `build.sh` to build the images you want in your microservice network. Use the `compose.sh` to jump-start your docker-compose network.
