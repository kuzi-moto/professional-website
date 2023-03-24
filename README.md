# professional-website

A simple docker image for my website [kuzmafesenko.com](https://kuzmafesenko.com/). It is a simple static site built with [Hugo](https://gohugo.io/), and served with [Nginx](https://nginx.org/en/).

## Downloading

The theme is added as a submodule, which is required otherwise the site will fail to build. By default `git clone` will not pull submodules, you must add the `--recurse-submodules` flag.

## Writing New Posts

Using Hugo:

```shell
hugo new post/name.md
```

## Testing

The fastest way to view changes and work on drafts is to ensure that the Hugo binary is installed on your machine, enter the `/src` directory, and run:

```shell
hugo server
```

This allows hugo to build the site, and serve it using the built-in webserver. By default the site is available at [http://localhost:1313](http://localhost:1313). Hugo will even monitor changes to files and rebuild the site nearly instantaneously.

## Running

### From Docker Hub

If you are reading this on Docker Hub and you are not me, but you still want to run my site for some reason, the quickest way to use this image is by executing the command `docker run kuzimoto/professional-website`.

### Build with Dockerfile

If you'd like to use this image for your own site then first `git pull https://github.com/kuzi-moto/professional-website`, make any changes and build with the provided script `./build.sh`. The resulting image can be run with `docker run -it professional-website`.
