#!/bin/bash

image="etherpad"
tag="mk1"

build-image () {
if test -s /bin/docker 
	then docker build -t ${image}:${tag} .
	else  "install docker"
fi

#if test -s /bin/podman
	#then podman build -t ${image}:${tag} .
	#else "install docker"
#fi
}
build-image
