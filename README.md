# Docker Image for Eclipse

## Why

## Usage

```bash
$ docker run -v ~/workspace/:/home/eclipse/workspace/ \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -d leesah/eclipse
```

The above command line launches the latest version of Eclipse, with your `~/workspace` folder mounted to `~eclipse/workspace/` in the container.

To launch an earlier version of Eclipse, simply run with `leesah/eclipse:<version>`. For example:

```bash
$ docker run -v ~/workspace/:/home/eclipse/workspace/ \
  -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -d leesah/eclipse:mars
```

## Troubleshooting

If you have trouble opening the window, try this:

```bash
$ xhost +si:localuser:eclipse
```
