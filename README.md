i2p.newsxml.build
=================

I2P Newsfeed build scripts which let me automatically transfer built news files
to the server. 

It might also be a mirror of my own signed newsfeeds in the future. To enable
this, just remove the build directory from the `.gitignore` file.

It assumes a Docker environment close to the defaults, for now. You must have
newsfeed signing keys.

To use it, if you already have signing keys, simply set the hostname of the server
you are using by creating a file `host` in this directory containing the hostname
or IP address, then run `make all`.
