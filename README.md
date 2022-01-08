# professional-website

A simple docker image for my website [kuzmafesenko.com](https://kuzmafesenko.com/). The website is built with [Hugo](https://gohugo.io/), with [Nginx](https://nginx.org/en/) as the webserver.

## Usage

### From Docker Hub

If you're reading this on Docker Hub and you're not me and for some reason you want to run my site, then the quickest way to using this image is with `docker run kuzimoto/professional-website`.

### Build with Dockerfile

If you'd like to use this image for your own site then first `git pull https://github.com/kuzi-moto/professional-website`, make any changes and build with the provided script `./build.sh`. The resulting image can be run with `docker run -it professional-website`.

### Testing

The fastest way to view changes and work on drafts is to ensure that the Hugo binary is installed on your machine, enter the `/src` directory, and run:

```
Hugo server
```

This allows hugo to build the site, and serve it using the built-in webserver. By default the site is available at [http://localhost:1313](http://localhost:1313). Hugo will even monitor changes to files and rebuild the site almost instantly.