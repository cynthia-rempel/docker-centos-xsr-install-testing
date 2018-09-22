# docker-centos-xsr-install-testing
The purpose of this repository is to determine what's required to install x steps recorder

To build:

  sudo docker build . -t xsr:test
  
To run

  sudo docker run -ti --rm --privileged  --name xsr xsr:test
  
To test, start the window manager

  sudo docker exec -ti xsr bash
  
  startx -- :3

Navigate to the window by:
Ctrl + alt + f3

TODO:
  still need to figure out how to launch xsr, now that I have a working window manager

Now that documenting the usage is out of the way, I can say so far, I've determined x steps recorder has the following dependencies:
  1. ImageMagick
  2. perl-HTML-Parser
  3. scrot
  4. xdotool
  5. xorg-x11-server-utils
  6. which

There are probably more, but I've been struggling to get fvwm to launch on another terminal... struggling with things like:
1. Getting x windows started in a docker container
2. Getting fvwm to stay launched
