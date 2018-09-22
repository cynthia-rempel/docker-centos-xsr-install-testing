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

Launch xsr by typing in the terminal:
xsr

To test xsr, click on some buttons, enter some text, then do a Ctrl+C.

There will be an Untitled Recording.html in the directory 

To inspect the results, do a docker cp of the Untitled Recodring.html to the host system, and open in your favorite browser.

Now that documenting the usage is out of the way, I can say so far, I've determined x steps recorder has the following dependencies:
  1. ImageMagick
  2. perl-HTML-Parser
  3. scrot
  4. xdotool
  5. xorg-x11-server-utils
  6. which

There are probably more, but I've stopped at getting a Untitled Recording.html:
1. Getting x windows started in a docker container
2. Getting fvwm to stay launched
